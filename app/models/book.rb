class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, dependent: :destroy
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  validates :title, presence: true
  validates :pub_year, presence: true, numericality: true
end
