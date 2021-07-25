class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :lockable, :timeoutable
         
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  
  has_many :reservarions
  has_many :rooms
  has_one :profile, dependent: :destroy
  before_create :build_default_profile
  private
  def build_default_profile
    build_profile
    true
  end
  
  def self.find_by_uid!(uid)
    User.find_by!("name = :p OR id = :p", p: uid)
  end
end