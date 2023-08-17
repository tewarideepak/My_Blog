class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :articles, through: :comments
  has_one :billing_address, dependent: :destroy
  has_one :mailing_address, dependent: :destroy

  accepts_nested_attributes_for :billing_address, :mailing_address

  mount_uploader :image,ImageUploader

  ROLES = %w{admin editor normal_user}  #for adding roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validate :validate_username_format
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def validate_username_format
    errors.add(:username, 'cannot have special characters other than "_"') if username.present? && username.match(/[^\w]/)
  end


  #Meta programming for creating roles methods
  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end

  def subscribed?
    subscribed
  end


end
