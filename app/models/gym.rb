class Gym < ApplicationRecord
  belongs_to :user
  validates :name, presence: true , uniqueness: true
  validates :description, presence: true
  validates :description, length: { minimum: 15 }
  validates :pricing, presence: true
end
