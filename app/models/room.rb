class Room < ApplicationRecord
  attachment :image
  has_many :reservarions
  belongs_to :user, dependent: :destroy
end