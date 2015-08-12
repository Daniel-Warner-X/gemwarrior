# lib/gemwarrior/entities/items/couch.rb
# Item::Couch

require_relative '../item'

module Gemwarrior
  class Couch < Item
    def initialize
      self.name         = 'couch'
      self.description  = 'Ever wanted to sit on a cloud? Now is your chance.'
      self.atk_lo       = nil
      self.atk_hi       = nil
      self.takeable     = false
      self.useable      = true
      self.equippable   = false
      self.equipped     = false
    end

    def use(player = nil)
      if player.at_full_hp?
        puts 'You come to rest on the impossibly soft surface of the furniture, but even after a few minutes of this seemingly heavenly hedonism you don\'t feel significantly better and decide to get up again.'
      else
        puts 'Your body comes to rest somewhere below the surface of the cloudy apparatus, almost as if it were floating *amongst* the couch. The feeling is heavenly, and you actually feel somewhat better after getting back up.'
        puts '>> You regain a hit point.'
        { type: 'rest', data: 1 }
      end
    end
  end
end
