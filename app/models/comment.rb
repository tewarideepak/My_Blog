class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :article

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
