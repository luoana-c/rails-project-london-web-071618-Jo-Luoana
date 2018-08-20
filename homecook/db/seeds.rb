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
  Cookster.create(
    name: Faker::Name.unique.name, address: Faker::Address.full_address
  )
end

5.times do
  Foodster.create(
    name: Faker::Name.unique.name
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
    cookster: Cookster.all.sample,
    name: Faker::Food.dish,
    cuisine_type: cuisine_types.sample
  )
end

one_order =Order.create(
  cookster: Cookster.all.sample,
  foodster: Foodster.all.sample,
  datetime: DateTime.now,
  amount: 5)

OrderRecipe.create(
  order: one_order,
  recipe: Recipe.find(1),
  recipe_count: 2
)

Recipe.all.each do |recipe|
  5.times do
    RecipeIngredient.create(recipe: recipe, ingredient: Ingredient.all.sample, ingredient_count: (1 + rand(9)))
  end
end
