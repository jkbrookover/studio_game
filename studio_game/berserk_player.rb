require_relative 'player'

class BerserkPlayer < Player 
	def initialize(name, health=100)
		super(name, health)
		@wOOt_count = 0
	end

	def berserk?
		@wOOt_count > 5
	end

	def wOOt
		super
		@wOOt_count +=1
		puts "#{@name} is berserk!" if berserk?
	end
	def blam
		if berserk?
			wOOt
		else
			super
		end
		# or use the ternary operator:
    	# berserk? ? w00t : super
	end
end

if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.wOOt }
  2.times { berserker.blam }
  puts berserker.health
end