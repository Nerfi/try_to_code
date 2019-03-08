class Gym < ApplicationRecord
  belongs_to :user
  validates :name, presence: true , uniqueness: true
  validates :description, presence: true
  validates :pricing, presence: true
end
