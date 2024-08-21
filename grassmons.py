# -*- coding: utf-8 -*-
"""
Created on Tue Aug 20 17:12:32 2024

@author: dwg11
"""

import csv
import re
import os

# Set the working directory
os.chdir('C:/Users/dwg11/PLC_Polished')

# Verify the change
print("Current working directory:", os.getcwd())

def format_location_name(name):
    """Converts location name to uppercase and removes special characters."""
    return re.sub(r'[^A-Z0-9]', '', name.upper())

def generate_wildmons_block(location, pokemons):
    """Generates the block of text for wild mons."""
    block = []
    block.append(f"\tdef_grass_wildmons {location}")
    block.append("\tdb 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite")
    
    times_of_day = ["morn", "day", "nite"]
    
    for time in times_of_day:
        block.append(f";\t; {time}")
        for i, pokemon in enumerate(pokemons):
            level = [8, 9, 7, 9, 7, 9, 5][i]  # Level pattern as in the example
            block.append(f"\twildmon {level}, {pokemon.upper()}")
    
    block.append("\tend_grass_wildmons")
    return "\n".join(block)

def convert_csv_to_text(csv_filename, text_filename):
    """Reads a CSV and writes a formatted text file."""
    with open(csv_filename, newline='') as csvfile:
        reader = csv.reader(csvfile)
        with open(text_filename, 'w') as txtfile:
            for row in reader:
                location_name = format_location_name(row[0])
                pokemons = row[1:8]  # Assuming 6 pokemons per location
                wildmons_block = generate_wildmons_block(location_name, pokemons)
                txtfile.write(wildmons_block + "\n\n")

# Usage
convert_csv_to_text('locations.csv', 'output.txt')