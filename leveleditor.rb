require "gosu"
require_relative "block"

class Level < Gosu::Window

	def initialize
		lines = File.read("level.txt")
		lines = lines.split(" ")
		super(736, 384)
		@blocks = []
		x = 0
		y = 0
		(0...276).each do |n|
			@blocks.push(Block.new(lines[n].to_i, x, y))
			x += 32
			if x >= 736
				x = 0
				y += 32
			end
		end
		@type = 0
	end

	def update

	end

	def needs_cursor?
		true
	end

	def button_down(id)
		if id == Gosu::Kb0
			@type = 0
		elsif id == Gosu::Kb1
			@type = 1
		elsif id == Gosu::Kb2
			@type = 2
		elsif id == Gosu::Kb3
			@type = 3
		elsif id == Gosu::KbS
			save
		elsif id == Gosu::KbC
			clear
		elsif id == Gosu::KbR
			load
		end
		@blocks.each do |block|
			if block.collide?(self.mouse_x, self.mouse_y)
				if id == Gosu::MsLeft
					block.setType(@type)
				end
			end
		end
	end

	def draw
		@blocks.each do |block|
			block.draw
		end
	end

	def save
		line_full = ""
		(0...276).each do |n|
			if n == 0
				if @blocks[n].getType == 0
					line_full += "0"
				else
					line_full += @blocks[0].getType.to_s
				end
				
			else
				if @blocks[n].getType == 0
					line_full += " " + "0"
				else
					line_full += " " + @blocks[n].getType.to_s
				end
			end
		end
		puts line_full
		File.write("level.txt", line_full)
	end

	def clear
		@blocks.each do |block|
			block.setType(0)
		end
	end

	def load
		lines = File.read("level.txt")
		lines = lines.split(" ")
		(0...276).each do |n|
			@blocks[n].setType(lines[n].to_i)
		end
	end

end

leveleditor = Level.new
leveleditor.show