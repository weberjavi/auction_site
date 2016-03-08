class Product < ActiveRecord::Base
  belongs_to :user


  def self.last_created_products(num_products)
    order(created_at: :desc).limit(num_products)
  end
end
