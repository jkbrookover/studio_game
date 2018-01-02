module Playable
	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def wOOt
		@health += 15
		puts "#{@name} got wOOted!"
	end
	def name=(new_name)
		@name = new_name.capitalize
	end
	def strong?
		@health >100
	end
end
