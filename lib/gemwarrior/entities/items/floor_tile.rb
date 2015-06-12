# lib/gemwarrior/entities/items/floor_tile.rb
# Item::FloorTile

require_relative '../item'

module Gemwarrior
  class FloorTile < Item
    def initialize
      self.name         = 'floor_tile'
      self.description  = 'One of the floor tiles, rough-hewn but immaculate, looks...off. Pressable, even.'
      self.atk_lo       = nil
      self.atk_hi       = nil
      self.takeable     = false
      self.useable      = true
      self.equippable   = false
      self.equipped     = false
    end
    
    def use
      puts 'You slowly lower your foot onto the tile, and then gently depress it, through the floor. Your whole body begins to feel light, lifeless. You black out.'
      puts
      
      t = Thread.new do
        print "#{Matrext::process({ :phrase => '*** SHOOOOOM ***', :oneline => true })}"
        puts
      end
      t.join
      
      {:type => 'move', :data => 'Sky Tower (Entrance)'}
    end
  end
end