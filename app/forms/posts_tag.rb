class PostsTag

  include ActiveModel::Model
  attr_accessor :title, :text, :image, :name

  with_options presence: true do
    validates :name
    validates :text
    validates :title
    validates :image
  end

  def save
    post = Post.create(title: title, text: text, image: image)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    PostTag.create(post_id: post.id, tag_id: tag.id)
  end

end