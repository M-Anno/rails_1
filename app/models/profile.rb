class Profile < ApplicationRecord
  # has_one_attached :avater
  belongs_to :user
  
  validates :name, presence: true
end