def conversation
	puts "Hello"
	yield
	puts "Goodbye"
end
conversation{puts "Good to meet you!"}

def five_times
	1.upto(5) do |count|
		yield count
	end
end
five_times do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end