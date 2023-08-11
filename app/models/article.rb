class Article < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true, length: {minimum:6,maximum:100}
    validates :description, presence: true, length: {minimum:10,maximum:300}
    validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    mount_uploader :image, ImageUploader
end
