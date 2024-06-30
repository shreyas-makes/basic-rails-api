Article.create(title: "First Article", content: "This is the content of the first article.")
Article.create(title: "Second Article", content: "This is the content of the second article.")

50.times do
  Article.create!(
    title: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    content: Faker::Lorem.paragraphs(number: 3).join("\n\n")
  )
end


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
