class Product < ActiveRecord::Base
 validates :name, presence: true

  has_many :orders
  has_many :comments


  def average_rating
    comments.average(:rating).to_f
  end

end
