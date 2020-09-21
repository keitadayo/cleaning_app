class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments
  has_many :post_tags
  has_many :goods
  belongs_to :user

end
