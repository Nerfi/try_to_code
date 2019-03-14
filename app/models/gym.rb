class Gym < ApplicationRecord
  #adding geocoder config
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  validates :name, presence: true , uniqueness: true
  validates :description, presence: true
  validates :description, length: { minimum: 15 }
  validates :pricing, presence: true
  #para poder añadir en nuestro model la foto
  mount_uploader :photo, PhotoUploader
end
