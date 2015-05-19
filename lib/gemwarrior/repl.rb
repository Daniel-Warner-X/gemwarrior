# lib/gemwarrior/repl.rb
# My own, simple, Read Evaluate Print Loop module

require 'readline'
require 'os'

require_relative 'constants'
require_relative 'version'
require_relative 'evaluator'

module Gemwarrior  
  class Repl
    private
    
    def clear_screen
      if OS.windows?
        system('cls')
      else
        system('clear')
      end
    end
    
    def print_splash_message
      0.upto(SPLASH_MESSAGE.length-1) do print "=" end
      print "\n"
      puts SPLASH_MESSAGE
      0.upto(SPLASH_MESSAGE.length-1) do print "=" end
      print "\n"
    end
    
    def print_fortune
      noun1_vals = ["abutments", "bains", "crocuses", "chapes", "civility", "fingering", "gabardines", "nooks", "scalawags", "squiggles"]
      noun2_vals = ["asterisms", "deniers", "diastoles", "extremities", "payments", "specters", "splats", "thalamuses", "wallets", "xylophones"]
      noun3_vals = ["blebs", "blowholes", "dancers", "dinges", "dualism", "ebullitions", "gullets", "knops", "phaetons", "snickers"]
      
      puts "* Remember: #{noun1_vals[rand(0..9)]} and #{noun2_vals[rand(0..9)]} are the key to #{noun3_vals[rand(0..9)]} *\n"
    end

    def prompt
      prompt_template =  "\n*****#{Gemwarrior::PROGRAM_NAME} v%s*****\n"
      prompt_template += "[LV:%3s][XP:%3s][HP:%3s|%-3s][STM:%2s|%-2s] -- [%s @ %s]"
      prompt_vars_arr = [
        Gemwarrior::VERSION,
        @world.player.level,
        @world.player.xp,
        @world.player.hp_cur, 
        @world.player.hp_max,
        @world.player.stam_cur,
        @world.player.stam_max,
        @world.player.name,
        @world.player.cur_loc.name
      ]
      puts (prompt_template % prompt_vars_arr)
    end
    
    def read_line
      Readline.readline(' > ', true).to_s
    end
    
    public
    
    def initialize(world, evaluator)
      @world = world
      @eval = evaluator
    end

    def start(initialCommand = nil)
      # welcome player to game
      clear_screen
      print_splash_message
      print_fortune 

      # hook to do something right off the bat
      puts @eval.evaluate(initialCommand) unless initialCommand.nil?
      
      # main loop
      loop do
        puts @eval.cur_msg unless @eval.cur_msg.nil?
        prompt
        begin
          input = read_line
          puts @eval.evaluate(input)
        rescue Interrupt
          puts
          puts QUIT_MESSAGE
          exit(0)
        end
      end
    end
  end
end
