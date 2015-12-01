require "gosu"

class Block

	def initialize(type, x, y)
		puts type
		@type = type
		@x = x
		@y = y
		if type == 0
			@image = Gosu::Image.new("block0t.png")
		elsif type == 1
			@image = Gosu::Image.new("block1t.png")
		elsif type == 2
			@image = Gosu::Image.new("block2t.png")
		elsif type == 3
			@image = Gosu::Image.new("block3t.png")
		end
	end

	def getX
		@x
	end

	def getY
		@y
	end

	def getType
		@type
	end

	def setType(type)
		@type = type
		if type == 0
			@image = Gosu::Image.new("block0t.png")
		elsif type == 1
			@image = Gosu::Image.new("block1t.png")
		elsif type == 2
			@image = Gosu::Image.new("block2t.png")
		elsif type == 3
			@image = Gosu::Image.new("block3t.png")
		end
	end

	def	draw
		@image.draw(@x, @y, 0)
	end

	def collide?(x, y)
		if x > @x && x < @x + 32 && y > @y && y < @y + 32
			true
		end
	end

end