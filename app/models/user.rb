class User < ApplicationRecord
    has_and_belongs_to_many :teams
    has_many :lists
    has_many :items, through: :lists

    has_secure_password
end
