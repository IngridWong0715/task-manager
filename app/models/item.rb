class Item < ApplicationRecord
  belongs_to :list
  delegate :team, :user, :to => :list, :allow_nil => true #implements the belongs_to, through relationship

  validates :name, presence: true
end
