class User < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true

  def self.last_created_users(num_users)
    order(created_at: :desc).limit(num_users)
  end
end
