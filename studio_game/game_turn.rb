require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'
require_relative 'loaded_die'

module GameTurn
  def self.take_turn(player)
    die = Die.new
    case die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped."
    else
      player.wOOt
    end

    treasure = TreasureTrove.random
    player.found_treasure(treasure)
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
  end
end
