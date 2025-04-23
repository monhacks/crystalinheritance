# -*- coding: utf-8 -*-
"""
Created on Mon Apr 21 13:07:25 2025

@author: dwg11
"""

import os
import re
import sys
import time

def count_characters(text):
    """
    Count characters in text with special rules:
    - '#' counts as 4 characters
    - '<PLAYER>' counts as 7 characters
    - All specified charmaps count as 1 character
    - '@' at the end of the string doesn't count
    - Checked to work with Polished Crystal v3.0.0 
    See: gfx/font/normal.png, charmap.asm, 
    """
    # Remove '@' character at the end of the string if present
    if text.endswith('@'):
        text = text[:-1]
    
    # Replace '#' with 4 characters worth
    text = text.replace('#', 'xxxx')
    
    # Replace '<PC>' with 4 characters worth
    text = text.replace('<PC>', 'xx')
    
    # Replace '<TM>' with 4 characters worth
    text = text.replace('<TM>', 'xx')

    # Replace '<ROCKET>' with 6 characters worth, home/text.asm
    text = text.replace('<ROCKET>', 'xxxxxx')

    # Replace '<TRAINER>' with 7 characters worth, home/text.asm
    text = text.replace('<TRAINER>', 'xxxxxxx')    

    # Replace <PLAYER> with 7 characters worth (<RIVAL> is already 7 characters long)
    text = text.replace('<PLAYER>', 'xxxxxxx')
    
    # Process special charmap characters that count as 1
    # Important: Order matters! Process longer patterns first
    # These come from charmap.asm 
    special_chars = [
        # Apostrophe combinations (process these first to avoid conflicts)
        "'d", "'l", "'m", "'r", "'s", "'t", "'v",
        # Then process single characters and other special sequences
        "'", "é", "É", "á", "ê", "í", "ó", "¿", "¡",
        "<PO>", "<KE>", "<PK>", "<MN>", "<ID>", "№", "<LV>", "<BOLDP>",
        "&", "♪", "♥", "×", "/", "%", "+", "<SHARP>",
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
        "¥", "▲", "▼", "◀", "▶", "▷", "…", "<PHONE>", # notable: ellipsis
        "<BLACK>", "<NONO>", "′", "″", "★", "↑", "↓", "<UPDN>"
    ]
    
    # Create a temporary string for counting
    temp_text = text
    
    # Replace each special character with a single placeholder
    for char in special_chars:
        temp_text = temp_text.replace(char, "x")
    
    return len(temp_text)

def check_line_for_typo(line, line_number, filename):
    """
    Check if a line contains a typo based on the rules:
    - Must follow keywords: text, line, para, or cont
    - More than 18 characters between quotes is a typo
    """
    # Pattern to match lines starting with one of the keywords followed by quoted text
    pattern = r'^\s*(text|line|para|cont)\s+"([^"]*)"'
    
    match = re.match(pattern, line)
    if match:
        keyword = match.group(1)
        quoted_text = match.group(2)
        
        char_count = count_characters(quoted_text)
        
        if char_count > 18:
            return {
                'filename': filename,
                'line_number': line_number,
                'line': line.strip(),
                'char_count': char_count,
                'keyword': keyword
            }
    
    return None

def scan_directory(directory):
    """
    Scan all .asm files in the given directory and subdirectories for typos
    """
    typos = []
    
    if not os.path.exists(directory):
        print(f"Error: Directory '{directory}' does not exist")
        return typos
    
    # Walk through the directory tree
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith('.asm'):
                filepath = os.path.join(root, filename)
                
                try:
                    with open(filepath, 'r', encoding='utf-8') as file:
                        for line_number, line in enumerate(file, 1):
                            typo = check_line_for_typo(line, line_number, filepath)
                            if typo:
                                typos.append(typo)
                except Exception as e:
                    print(f"Error reading file {filepath}: {str(e)}")
    
    return typos

def main():
    # Start timing
    start_time = time.time()
    
    # Use current directory
    directory = os.getcwd()
    output_file = 'asm_typos.txt'
    
    print(f"Scanning directory '{directory}' for typos...")
    
    typos = scan_directory(directory)
    
    with open(output_file, 'w', encoding='utf-8') as f:
        if not typos:
            f.write("No typos found!\n")
            print("No typos found!")
        else:
            f.write(f"Found {len(typos)} typo(s):\n")
            f.write("-" * 50 + "\n")
            
            for typo in typos:
                f.write(f"File: {typo['filename']}\n")
                f.write(f"Line {typo['line_number']}: {typo['line']}\n")
                f.write(f"Character count: {typo['char_count']} (> 18)\n")
                f.write("-" * 50 + "\n")
            
            print(f"Found {len(typos)} typo(s). Results written to {output_file}")
    
    # End timing
    end_time = time.time()
    execution_time = end_time - start_time
    
    print(f"Output written to {output_file}")
    print(f"Execution time: {execution_time:.2f} seconds")

if __name__ == "__main__":
    main()