class List < ApplicationRecord
  belongs_to :user
  belongs_to :team # for now, a list EITHER belongs to a user, OR to a team
  has_many :items
end
