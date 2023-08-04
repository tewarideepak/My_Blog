class Article < ApplicationRecord

    has_many :comments,dependent: :destroy  #Deleting associated objects

    validates :title, presence: true, length: {minimum:6,maximum:100}
    validates :description, presence: true, length: {minimum:10,maximum:300}
end
