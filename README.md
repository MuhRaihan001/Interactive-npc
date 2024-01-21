# NPC Interaction System Documentation

This document provides an overview of the NPC interaction system implemented in the provided `npc.pwn` and `main.pwn` scripts. The system allows players to interact with NPCs in a game environment.

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Functions](#functions)
5. [Example](#example)
6. [Contributing](#contributing)
7. [License](#license)

## Introduction

The NPC interaction system is designed to enable players to interact with non-player characters (NPCs) in a game environment. The NPCs are loaded into the game world with specific coordinates and characteristics, and players can trigger interactions with them using a designated key.

## Installation

To integrate the NPC interaction system into your Pawn script, follow these steps:

1. Copy the provided `npc.pwn` and `main.pwn` scripts into your project directory.
2. Include `npc.pwn` in your main script using `#include "path to npc.pwn"`.
3. Ensure that the functions from `npc.pwn` are appropriately called in your game logic.

## Usage

The system provides a set of functions to load NPCs into the game world, determine the nearest NPC to a player, and trigger interactions with NPCs. Players can use a designated key (default: "N") to initiate interactions with nearby NPCs.

## Functions

### `LoadNpc()`

Loads NPCs into the game world based on predefined coordinates and characteristics. NPCs are created as actors with associated 3D text labels and collision points.

### `GetNearestNpc(playerid, Float: dist)`

Returns the index of the nearest NPC to the specified player within a given distance. If no NPC is found within the specified distance, the function returns -1.

### `OnTalkWithNpc(npcid, playerid)`

Handles the interaction with an NPC based on its index (`npcid`). This function can be customized to perform specific actions when interacting with different NPCs.

## Example

```pawn
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(PRESSED(KEY_NO)) // Key "N"
    {
        new npcid = GetNearestNpc(playerid, 3.5);
        OnTalkWithNpc(npcid, playerid);
    }
    return 1;
}
```

In this example, when the player presses the "N" key, the system identifies the nearest NPC within a distance of 3.5 units and triggers the `OnTalkWithNpc` function.

```pawn
public OnTalkWithNpc(npcid, playerid)
{
    switch(npcid)
    {
        case 0:
            SendClientMessage(playerid, 0xFFFFFFFF, "Work");
    }
    return 1;
}
```

The `OnTalkWithNpc` function is then customized to handle the interaction with the specific NPC identified by its index (`npcid`). In this case, if the nearest NPC has an index of 0, the player receives a message saying "Work."

## Contributing

Feel free to contribute to the development of this NPC interaction system by submitting pull requests, reporting issues, or suggesting improvements.

## License

This NPC interaction system is provided under the [License](LICENSE).
