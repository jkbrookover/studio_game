def conversation
	puts "Hello"
	yield
	puts "Goodbye"
end
converstion{puts "Good to meet you!"}