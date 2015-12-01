require "gosu"
require_relative "block"

class Level < Gosu::Window

	def initialize
		super(752, 384)
		@blocks = []
		x = 0
		y = 0
		(0...1128).each do |n|
			@blocks.push(Block.new(3, x, y))
			x += 16
			if x >= 752
				x = 0
				y += 16
			end
		end
		puts @blocks.length
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

end

leveleditor = Level.new
leveleditor.show