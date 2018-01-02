require_relative 'player'

describe Player do
	before do
		$stdout = StringIO.new
	end
	before do
		@initial_health = 150
		@player = Player.new("larry", @initial_health)
	end
	it "has a capitalized name" do
		

		expect(@player.name).to eq("Larry")
	end
	it "has an initial health" do
		

		expect(@player.health).to eq(150)
	end
	
	it "has a string representation" do
  		@player.found_treasure(Treasure.new(:hammer, 50))
  		@player.found_treasure(Treasure.new(:hammer, 50))

  		@player.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
	end
	it "computes a score as the sum of its health and length of name" do
		@player.found_treasure(Treasure.new(:hammer, 50))
		@player.found_treasure(Treasure.new(:hammer, 50))



		expect(@player.score).to eq(250)
	end

	it "increases health by 15 when wOOted" do
	
		@player.wOOt

		expect(@player.health).to eq(@initial_health + 15)

	end
	it "decreases health b 10 wehen blammed" do
		
		@player.blam

		expect(@player.health).to eq(@initial_health - 10)
	end


	it "is strong" do
			expect(@player.strong?).to eq(true)
	end
	context "with a health of 100 or less" do
		before do 
			@player = Player.new("larry", 100)
		end
		it "is wimpy" do
			expect(@player).not_to be_strong
		end
		
	end

	context "in a collection of players" do
		before do
			@player1 = Player.new("moe", 100)
			@player2 = Player.new("larry", 200)
			@player3 = Player.new("curly", 300)

			@players = [@player1, @player2, @player3]
		end

		it "is sorted by decreasing score" do
			@players.sort.should == [@player3, @player2, @player1]
		end	
	end
	it "computes points as the sum of all treasure points" do
		@player.points.should == 0

  		@player.found_treasure(Treasure.new(:hammer, 50))

  		@player.points.should == 50

  		@player.found_treasure(Treasure.new(:crowbar, 400))

  		@player.points.should == 450

 		@player.found_treasure(Treasure.new(:hammer, 50))

  		@player.points.should == 500
	end
	it "yields each found treasure and its total points" do
  		@player.found_treasure(Treasure.new(:skillet, 100))
  		@player.found_treasure(Treasure.new(:skillet, 100))
		@player.found_treasure(Treasure.new(:hammer, 50))
 		@player.found_treasure(Treasure.new(:bottle, 5))
  		@player.found_treasure(Treasure.new(:bottle, 5))
  		@player.found_treasure(Treasure.new(:bottle, 5))
 		@player.found_treasure(Treasure.new(:bottle, 5))
  		@player.found_treasure(Treasure.new(:bottle, 5))

  		yielded = []
  		@player.each_found_treasure do |treasure|
  			yielded << treasure
  		end

  		yielded.should == [
	    	Treasure.new(:skillet, 200),
	    	Treasure.new(:hammer, 50),
	    	Treasure.new(:bottle, 25)
 		]
	end

end