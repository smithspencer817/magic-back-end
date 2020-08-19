class User < ApplicationRecord
    has_many :user_cards, :dependent => :destroy
    has_many :cards, through: :user_cards
end
