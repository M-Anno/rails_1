class Room < ApplicationRecord
  has_many :reservarions
  belongs_to :user, dependent: :destroy
end