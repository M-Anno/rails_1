class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :lockable, :timeoutable
         
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
end
