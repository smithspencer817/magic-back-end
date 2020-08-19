# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

30.times do 
    Card.create(
        name: Faker::Name.name,
        mana_cost: ["{G}{G}{U}", "{A}{S}{S}", "{G}{D}{I}"].sample,
        img_url: ["https://www.obilisk.co/wp-content/uploads/2017/10/DFE8EE86-45EC-497A-9FDF-CA5CF05337FB-888x500.jpeg", "https://images4.alphacoders.com/207/thumb-350-207154.jpg"].sample,
        spell_type: ["instance", "creature", "sorcery", "planeswalker", "land"].sample,
        description: Faker::String.random,
    )
end

50.times do 
    user_card = UserCard.new

    user_card.user = User.all.sample
    user_card.card = Card.all.sample

    user_card.save
end

