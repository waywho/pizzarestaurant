class PizzaRestaurant

	def initialize
		self.menu
		puts "Welcome to the Pizza World."
	end

	def how_to_order
		puts "Would you like to pick the pizza or by ingredient?"
		print "'pizza' or 'ingredient' > "
		choice = gets.chomp.downcase
		if choice == "pizza"
			self.order
		elsif choice == "ingredient"
			self.select_by_ingredient
		end
	end

	def menu
		@pizzas = {
			"rustica" => ["tomato sauce", "mozzarella", "chicken breast", "baby spinach", "tomato", "olive oil", "oregano"],
			"mediterranea" => ["mozzarella", "pesto", "tomato sauce", "aubergine", "courgettes", "red peppers", "mozzarella"],
			"margherita" => ["tomato sauce", "olive oil", "mozzarella"],
			"chorizo" => ["chorizo", "basil", "red peppers", "tomato", "mozzarella"]
		}
	end

	def menu_display
		@pizzas.each do |type, ingredients|
			puts "#{type}: #{ingredients}"
		end
	end

	def order #pizza_choice can be put in () as an argument taken here
		puts "What kind of pizza would you like?"
		print "> "
		pizza_choice = gets.chomp # line 19-21 will not be needed if argument is taken at def
		if @pizzas.include?(pizza_choice)
			puts "#{pizza_choice} is a great choice. Coming Right up!"
		else
			puts "Sorry we don't have the #{pizza_choice} pizza."
			puts "Here is the menu:"
			self.menu_display
			puts "Let's try again..."
			self.how_to_order
		end
	end

	def select_by_ingredient
		@recommendations = []
		puts "What ingredient would you like to choose your pizza by?"
		print "> "
		ingredient_choice = gets.chomp
		@pizzas.each do |type, ingredients|
			if ingredients.include?(ingredient_choice)
				@recommendations << type
			end
		end
		if @recommendations.length == 0
			puts "Sorry we don't have any pizza with #{ingredient_choice}."
			puts "Here is the menu:"
			self.menu_display
			puts "Let's try again..."
			self.how_to_order
		elsif @recommendations.length > 1
		puts "May we recommend the #{@recommendations} pizzas?"
		else 
		puts "May we recommend the #{@recommendations} pizza?"
		end
	end
end

pizza = PizzaRestaurant.new
pizza.how_to_order
pizza.order
pizza.select_by_ingredient