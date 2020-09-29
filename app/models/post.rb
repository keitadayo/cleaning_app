class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments
  has_many :goods
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
