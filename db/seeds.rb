# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name:"Test", email:"testuser@test.com",
             password:"testpassword")

two_days_breakfast = user.meals.create(title:"Breakfast")
two_days_breakfast.created_at = 2.days.ago
two_days_lunch = user.meals.create(title:"Lunch")
two_days_lunch.created_at = 2.days.ago
two_days_dinner = user.meals.create(title:"Dinner")
two_days_dinner.created_at = 2.days.ago
two_days_breakfast.save
two_days_lunch.save
two_days_dinner.save
two_days_breakfast.foods.create!(name:"Grapes",calories:35)
two_days_breakfast.foods.create!(name:"Avocado",calories:22)
two_days_breakfast.foods.create!(name:"Jam",calories:133)
two_days_breakfast.foods.create!(name:"Donuts",calories:310)
two_days_breakfast.foods.create!(name:"Tea",calories:10)
two_days_lunch.foods.create!(name:"Mushrooms",calories:70)
two_days_lunch.foods.create!(name:"Tomato Soup",calories:100)
two_days_lunch.foods.create!(name:"Rice",calories:213)
two_days_lunch.foods.create!(name:"Eggplant",calories:210)
two_days_lunch.foods.create!(name:"Watermelon",calories:90)
two_days_dinner.foods.create!(name:"Crackers",calories:120)
two_days_dinner.foods.create!(name:"Salad",calories:100)
two_days_dinner.foods.create!(name:"Feta Cheese",calories:110)

yesterday_breakfast = user.meals.create(title:"Breakfast")
yesterday_breakfast.created_at = 1.days.ago
yesterday_lunch = user.meals.create(title:"Lunch")
yesterday_lunch.created_at = 1.days.ago
yesterday_dinner = user.meals.create(title:"Dinner")
yesterday_dinner.created_at = 1.days.ago
yesterday_breakfast.save
yesterday_lunch.save
yesterday_dinner.save
yesterday_breakfast.foods.create!(name:"Tomato",calories:43)
yesterday_breakfast.foods.create!(name:"Cucumber",calories:32)
yesterday_breakfast.foods.create!(name:"Cheese",calories:123)
yesterday_breakfast.foods.create!(name:"Olives",calories:212)
yesterday_breakfast.foods.create!(name:"Bagels",calories:110)
yesterday_lunch.foods.create!(name:"Bread",calories:110)
yesterday_lunch.foods.create!(name:"Lentil Soup",calories:121)
yesterday_lunch.foods.create!(name:"Rice",calories:213)
yesterday_lunch.foods.create!(name:"Peas",calories:176)
yesterday_lunch.foods.create!(name:"Yoghurt",calories:100)
yesterday_dinner.foods.create!(name:"Figs",calories:55)
yesterday_dinner.foods.create!(name:"Salad",calories:125)
yesterday_dinner.foods.create!(name:"Zucchini",calories:87)

breakfast = user.meals.create!(title:"Breakfast")
lunch = user.meals.create!(title:"Lunch")
dinner = user.meals.create!(title:"Dinner")

breakfast.foods.create!(name:"Tomato",calories:43)
breakfast.foods.create!(name:"Cucumber",calories:32)
breakfast.foods.create!(name:"Cheese",calories:123)
breakfast.foods.create!(name:"Olives",calories:212)
breakfast.foods.create!(name:"Bread",calories:110)
lunch.foods.create!(name:"Bread",calories:110)
lunch.foods.create!(name:"Tomato Soup",calories:121)
lunch.foods.create!(name:"Rice",calories:213)
lunch.foods.create!(name:"Beans",calories:176)
lunch.foods.create!(name:"Yoghurt",calories:100)
dinner.foods.create!(name:"Apple",calories:55)
dinner.foods.create!(name:"Salad",calories:125)
dinner.foods.create!(name:"Eggplant",calories:87)
