class Article < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :users, through: :comments
    has_many :likes
    has_many :dislikes

    validates :title, presence: true, length: {minimum:6,maximum:100}
    validates :description, presence: true, length: {minimum:10,maximum:300}

    mount_uploader :image, ImageUploader


    def liked_by_user?(user)
        likes.where(user: user).exists?
      end
    
    def disliked_by_user?(user)
        dislikes.where(user: user).exists?
    end
end
