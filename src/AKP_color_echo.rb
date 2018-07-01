require "color_echo/get"
# require 'color_echo' # overwrite kernel module functions

module AKP_color_echo

  def colored_print_by_country area
	case area.country
	when "free" # nobody occupates
	  print area.dice.to_s+" " # default console fg, ex. white
	when "player" # black
	  colored_print area.dice.to_s+" ", "index234"
	  return
	when "cpu1"   # blue
	  colored_print area.dice.to_s+" ", "blue"
	  return
	when "cpu2"   # red
	  colored_print area.dice.to_s+" ", "index2"
	  return
	when "cpu3"   # orange
	  colored_print area.dice.to_s+" ", "index167"
	  return
	else
	  return
	end

  end

	def colored_print(str, color)
		print CE.once.fg(color.to_sym).get(str)
	end



	def colored_puts(str, color)
		puts CE.once.fg(color.to_sym).get(str)
	end


=begin
hello  = CE.fg(:yellow).get("Hello")
world  = CE.fg(:index199).bg(:gray).tx(:bold).get("World")
exclam = CE.rainbow.get("!!!!!!!!!!!!!!!!")
puts hello + " " +  world + " " + exclam
puts CE.fg(:blue).pickup(/color$/, :index199).pickup(/^color/, :h_green).get("color color color")
=end
end
