class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_one :profile, dependent: :destroy
end
