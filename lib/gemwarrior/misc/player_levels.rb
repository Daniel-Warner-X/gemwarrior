# lib/gemwarrior/misc/player_levels.rb
# Stats table for each level the player can reach

module Gemwarrior
  module PlayerLevels
    def self.get_level_stats(level)
      case level
      when 1
        {
          level:    1,   xp_start:   0,
          hp_max:   30,
          atk_lo:   1,   atk_hi:     2, 
          defense:  1,   dexterity:  3,
          special_abilities: nil
        }
      when 2
        { 
          level:    2,   xp_start:   50,
          hp_max:   35,
          atk_lo:   2,   atk_hi:     3, 
          defense:  3,   dexterity:  4,
          special_abilities: :rocking_vision
        }
      when 3
        { 
          level:    3,   xp_start:   120,
          hp_max:   45,
          atk_lo:   3,   atk_hi:     5, 
          defense:  5,   dexterity:  6,
          special_abilities: :gleam
        }
      when 4
        {
          level:    4,   xp_start:   250,
          hp_max:   55,
          atk_lo:   5,   atk_hi:     6, 
          defense:  6,   dexterity:  8,
          special_abilities: :rock_slide
        }
      when 5
        { 
          level:    5,   xp_start:   600,
          hp_max:   70,
          atk_lo:   7,   atk_hi:     8, 
          defense:  8,   dexterity:  9,
          special_abilities: :graniton
        }
      when 6
        { 
          level:    6,   xp_start:   1000,
          hp_max:   85,
          atk_lo:   8,   atk_hi:     10, 
          defense:  10,  dexterity:  11,
          special_abilities: :stone_face
        }
      when 7
        { 
          level:    7,   xp_start:   1500,
          hp_max:   100,
          atk_lo:   10,  atk_hi:     12, 
          defense:  13,  dexterity:  14,
          special_abilities: :breakthru
        }
      else
        {
          level:    8,   xp_start:   10000,
          hp_max:   200,
          atk_lo:   50,  atk_hi:     100,
          defense:  50,  dexterity:  100,
          special_abilities: nil
        }
      end
    end

    def self.check_level(xp)
      if xp < 50
        1
      elsif xp < 120
        2
      elsif xp < 250
        3
      elsif xp < 600
        4
      elsif xp < 1000
        5
      elsif xp < 1500
        6
      elsif xp < 10000
        7
      else
        8
      end
    end

    def self.get_ability_description(ability)
      case ability
      when :rocking_vision # LV2
        'Allows you to see the enemy hit points while in battle.'
      when :gleam          # LV3
        'The map now shows every place in Jool, whether you have been there or not.'
      when :rock_slide     # LV4
        'Adds a random boost to the player\'s attack in battle.'
      when :graniton       # LV5
        'Chance to be much more accurate in your attacks.'
      when :stone_face     # LV6
        'Chance to auto-win in battle against any non-boss monster (does not work in arena or if ambushed).'
      when :breakthru
        'Teleport to any location, given that you can remember its name.'
      else
        'Unsure, but it\'s probably cool!'
      end
    end
  end
end
