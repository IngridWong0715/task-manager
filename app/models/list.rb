class List < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team, optional: true # for now, a list EITHER belongs to a user, OR to a team
  has_many :items

  validates :name, presence: true
end
