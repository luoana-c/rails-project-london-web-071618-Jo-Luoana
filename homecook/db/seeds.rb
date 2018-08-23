# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cuisine_types = [
  "indian",
  "italian",
  "vegetarian",
  "japanese",
  "french",
  "pasta",
  "kebab"
]

5.times do
  User.create(
    name: Faker::Name.unique.name, address: Faker::Address.full_address, cookster: true, password: "password"
  )
end

5.times do
  User.create(
    name: Faker::Name.unique.name, address: Faker::Address.full_address, cookster: false, password: "password"
  )
end


20.times do
  Ingredient.create(
    name: Faker::Food.ingredient,
    unit_type: Faker::Food.metric_measurement
  )
end

10.times do
  Recipe.create(
    user_id: User.all.select{|u| u.cookster == true}.sample.id,
    name: Faker::Food.dish,
    cuisine_type: cuisine_types.sample
  )
end

one_order =Order.create(
  cookster_id: User.all.select{|u| u.cookster == true}.sample.id,
  foodster_id: User.all.select{|u| u.cookster == false}.sample.id,
  datetime_order_placed: (DateTime.now + 1)
)

OrderRecipe.create(
  order: one_order,
  recipe: Recipe.first,
  recipe_count: (1 + rand(3))
)

Recipe.all.each do |recipe|
  5.times do
    RecipeIngredient.create(recipe: recipe, ingredient: Ingredient.all.sample, ingredient_count: (1 + rand(9)))
  end
end
