import 'package:Tools/dm_tool.dart';

/**
 * Tools Requirements
 *
 * -----DM Profile-----
 * - Saves information about previous sessions to local file system
 * - JSON Format
 * - Tool starts by prompting to load DM profile or start from scratch
 * - Can save the following:
 * -- Max Party Level
 * -- Party Members
 * -- Dice Rolls
 * -- Monsters
 * -- Encounters
 * -- DM Notes
 *
 * -----Loot Gen-----
 * - Random Loot Drops
 * - Loot based on investigation check (searching a body)
 * - Encounter Loot
 * -- Based on difficulty and max party level
 * - Should have loot for common, medium, and rare items as well as gold. Can also contain general items
 *    such as gems, trinkets, supplies, potions, rare world items, and collectibles
 *
 * -----Dice Roller-----
 * - Roll any sided dice (not just d20, d12, d10, etc.)
 * - Add any modifier (2d10, 3d10+5, etc.)
 * - Save common dice rolls to DM profile
 * -- Saved rolls have a name and reference to what the roll is
 * - Write roll in standard notation (3d10 + 10)
 *
 * -----Encounter Tracker-----
 * - Add Monsters with current health
 * -- Save monster to DM profile
 * - Easily add and subtract health from monster
 * - Add dice rolls for individual monsters
 * - Set up encounters ahead of time
 *
 *
 */

void main() {
  DmTool tool = new DmTool();
  tool.init();
}
