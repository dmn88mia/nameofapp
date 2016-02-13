class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }


  belongs_to :user
  belongs_to :product
end
