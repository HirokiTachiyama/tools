require "curses"

require_relative 'memo'
# require_relative 'twitter'
require_relative 'util'

include Curses


class AKP

  def read_config(config, file_name)
    f = open file_name
    f.each do |l|
      k, v = l.split '='
      config[k] = v
    end
    f.close
  end

  def main(config_file_path)
    if config_file_path.include? "~" then
      config_file_path.gsub! "~", ENV['HOME']
    end
    config = Hash.new

    ### Main process
    read_config(config, config_file_path)

    # get path
    memo_dir=nil;
    input=0

    main_loop config

    puts "akp fin"
 end

  def main_loop(config)
    input = nil 
    while input != "quit"
      print "Function? : "
      input = gets.chomp
      
      case input
      when "twitter"
  #     new Twitter.main
        puts "Not implemented yet!"
      when "memo"
        Memo.new.main_loop config
      when "help", "h"
        show_help
      when "quit"
        break
      else
        print "Invalid command : ", input, "\n"
      end

    end
  end
 

  def show_help
    puts "twitter", "memo", "help"
  end

end

