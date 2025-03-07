# FAQ

If you have a question about Crystal Inheritance, or think you've found a bug, please read this FAQ first.

You can report bugs on the discord or to me on Reddit by DM, u/dwg6m9

### Which file do I need to play?

This is the ROM you should use for patching:

* Pokémon - Crystal Version (UE) (V1.0) [C][!].gbc
  (`md5: 9f2922b235a5eeb78d65594e82ef5dde`)

It's identical to the one built by the [pokecrystal](https://github.com/pret/pokecrystal) project.


### Is there documentation for all the {Pokémon, items, moves, etc}?

The game's [data files](data/) do a fairly good job of listing things you'll want to know. Some highlights:

* [Base stats and TM learnsets](data/pokemon/base_stats/)
* [Level-up learnsets and evolution methods](data/pokemon/evos_attacks.asm)
* [Egg moves](data/pokemon/egg_moves.asm)
* [Move attributes](data/moves/moves.asm)
* [TM+HM+tutor list](data/moves/tmhm_moves.asm)
* [Wild Pokémon](data/wild/)
* TODO: Trainer Parties and movesets (Spoilers!)

A route-by-route encounter table is posted in at ___ (insert screenshot or excel table)

### My Pokémon is a different color, is it shiny?

There's a 1 in 1,024 chance to encounter a shiny Pokémon, and they'll be marked with a star next to their name. You're probably noticing the effect of the **IVs vary colors** option (see below).

### What are the options at the start of a new game?

* **Natures:** Enables [natures](https://bulbapedia.bulbagarden.net/wiki/Nature) from Gen 3 onward.
* **Abilities:** Enables [abilities](https://bulbapedia.bulbagarden.net/wiki/Ability) from Gen 3 onward.
* **Phys/Spcl split:** Enables the [Physical/Special split](https://bulbapedia.bulbagarden.net/wiki/Damage_category) from Gen 4 onward.
* **Exp. scaling:** Enables the [experience formula](https://bulbapedia.bulbagarden.net/wiki/Experience#Gain_formula) from Gen 5, 7 and 8, which scales experience by the ratio of the opponent's level to your level.
* **IVs vary colors:** Enables color variation [inspired by Stadium](https://bulbapedia.bulbagarden.net/wiki/List_of_alternately_colored_Pok%C3%A9mon_in_the_games#Pok.C3.A9mon_Stadium). DVs will subtly vary Pokémon colors. This applies to normal and shiny Pokémon.
* **Perfect stats:** All Pokémon stats, for you and the opponent, are calculated as if they had maximum IVs. The actual IVs are still random, so color variation and Hidden Power type are not affected.
* **Traded Pokémon treat you as OT:** All differences in traded Pokémon go away: they always obey you, don't gain boosted experience, and can be nicknamed.
* **Nuzlocke mode:** Enables a [Nuzlocke challenge](https://bulbapedia.bulbagarden.net/wiki/Nuzlocke_Challenge); see [FEATURES.md](FEATURES.md) for detailed clauses.

If you need to change these options after starting a game, press Left+B at the title screen to reset them.


### I don't recognize this move, what is it?

There's only room for 255 moves, including Struggle. I wanted to fit in as many useful new moves as possible, so some similar moves were combined to free up space.

* "**Fury Strikes**" = Fury Swipes + Fury Attack
* "**Healing Light**" = Morning Sun + Moonlight + Synthesis
* "**Fresh Snack**" = Softboiled + Milk Drink

### How do I evolve my Pokémon?

* Item trade evolutions (like Seadra into Kingdra while holding a Dragon Scale) now evolve while holding the item.
* Yanma, Tangela, and Piloswine evolve while knowing AncientPower.
* Eevee evolves into Leafeon in Ilex Forest, site of the Moss Rock.
* Eevee evolves into Glaceon in the Ice Path, site of the Ice Rock.
* Eevee evolves into Sylveon with a Shiny Stone.
* Magneton evolves into Magnezone in Rock Tunnel, site of the Lodestone.
* Machoke, Graveler, Haunter, and Kadabra evolve by having sufficient EVs in Attack, Defense, Speed, and Special respectively (five Protein, Iron, Carbos, or Calcium is enough).
* TODO: Insert other unique evolutions

### Where do I get this item?

*...

Full spreadsheet is at: TODO 

### Where do I get this TM/HM or move tutor?

TODO: Post spreadsheet

### What do blessings and photographs do?

They make your Pokémon happier, just like haircuts or grooming.


### What is the Judge Machine?

The Judge Machine in Goldenrod City's PokéCom Center shows your Pokémon's EVs (effort) and IVs (potential). 

### What are suggested level caps?

TODO

Anarres: 
Gauldenrod: 
Goldenrod:
Violet:
Dance Theatre:
Trader's Landing Port:
Lighthouse:
Mahogany:
Sinjoh Meeting:
Eerie Hamlet:
Final Gauntlet:
Final Boss:

### Wait, who is this character?

Hollis:
Tammy:
Mejimi:
Bobesh:
Kensey:
Adrinna:
Samsara:
Barbeau:
Kanna:
Amos:



### Spoilers below!


### Wait, who is this character?

Hollis: Elder of Anarres Town. 
Mejimi: Emperor of Historic Johto. Loosely inspired by Emperor Meiji of Japan.
Bobesh: General and aide to Mejimi, overseer of Gauldenrod. 
Kensey: General and aide to Mejimi, overseer of Trader's Landing. 
Adrinna: General and aide to Mejimi, overseer of mining operation in historic Mt Mortar.
Samsara: Spiritual aide to Mejimi. 
Sandra: Elder of Gauldenrod. 
Barbeau: Elder of Trader's Landing. 
Kanna: Hisuian leader. 
Amos: Leader of resistance to Mejimi. 


### Where do I get the legendary Pokémon?

Legendary pokemon not encountered as part of the plot are found in the locations below: 

*Entei: Solve the last Alph puzzle and use the item obtained on the rock indent on the eastern half of Route 42. 
*Suicune: Save the Miltank on Route 39. 
*Raikou: Top of Lighthouse 
*Lugia: Historic Whirl Islands (Sheltered Shores), requires waterfall
*Ho-Oh: Show Morty any of the legendary beasts, defeat him, and ascend Tin Tower. 
*Heatran: End of Clast's Cradle. 

### I'm stuck on the trade quest for the master ball!

...


### I can't figure out this puzzle!

Puzzle solutions are posted on youtube: (TODO)

Kimono puzzles:

Whirl Island:

Clast's Cradle (historic Mt Mortar): 

Brass Tower:

### Where did this Pokémon go?

Most first forms were removed to make room for more evolutionary lines. 

Others whose types were already overrepresented (normal-flying, for example) were cut entirely.

### I want the missing Pokémon back!

As [FEATURES.md](FEATURES.md) notes, 14 Pokémon had to be removed to make room for 17 Pokémon from Gen 4 (as well as Sylveon from Gen 6 to complete the Eeveelutions). I won't be able to restore them until the engine supports species IDs larger than 8 bits. There are some plans for 9-bit IDs, allowing over 500 Pokémon, but it will take time.

I do think that the added Pokémon are one part of "polishing" Crystal version. Some of the new or improved things from Gen 4, like Leafeon, Tangrowth, or the extra map of Slowpoke Well, were originally planned for Gen 2, as we now know from the [Space World '97](https://tcrf.net/Proto:Pok%C3%A9mon_Gold_and_Silver/Spaceworld_1997_Demo) ROMs. The Sinjoh Ruins in HG/SS emphasize this connection between Johto/Gen 2 and Sinnoh/Gen 4. Although cutting any Pokémon is regrettable, I'd consider skipping Pokémon like Porygon-Z or Honchkrow to be worse than replacing Delibird or Lickitung.
