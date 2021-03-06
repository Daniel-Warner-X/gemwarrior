# lib/gemwarrior/entities/monsters/apatiger.rb
# Entity::Creature::Monster::Apatiger

require_relative '../monster'

module Gemwarrior
  class Apatiger < Monster
    def initialize
      super

      self.name         = 'apatiger'
      self.name_display = 'Apatiger'
      self.description  = 'Apathetic about most everything as it lazes around, save for eating you.'
      self.battlecry    = 'Gggggggggrrrrrrrrrrrrrrrrooooooooooowwwwwwwwwwwwlllllllll!'
      self.face         = 'calloused'
      self.hands        = 'soft'
      self.mood         = 'apathetic'

      self.level        = rand(4..5)
      self.hp_cur       = rand((level * 2)..(level * 3))
      self.hp_max       = hp_cur
      self.atk_lo       = rand(level..(level * 1.5).floor)
      self.atk_hi       = rand((level * 1.5).floor..(level * 2.5).floor)
      self.defense      = rand(4..7)
      self.dexterity    = rand(3..7)

      self.rox          = rand((level * 2)..(level * 3))
      self.xp           = rand(level..(level * 2))
    end
  end
end
