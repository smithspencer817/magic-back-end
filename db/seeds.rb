# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

results = RestClient.get 'https://api.magicthegathering.io/v1/cards'
cards = JSON.parse(results)["cards"]

User.destroy_all
Card.destroy_all
UserCard.destroy_all

10.times do 
    User.create(
        name: Faker::Name.name,
        username: Faker::Games::DnD.klass,
        password_digest: Faker::Games::DnD.klass
    )
end

cards.each do |card|
    Card.create(
        name: card["name"],
        mana_cost: card["manaCost"],
        img_url: card["imageUrl"],
        spell_type: card["type"],
        description: card["text"]
    )
end

50.times do 
    user_card = UserCard.new

    user_card.user = User.all.sample
    user_card.card = Card.all.sample

    user_card.save
end

