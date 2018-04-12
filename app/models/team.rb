class Team < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :lists
  has_many :items, through: :lists
end
