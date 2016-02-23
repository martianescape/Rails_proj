class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: {minimum: 10, maximum: 250}
  validates :discription, presence: true, length: {minimum: 10, maximum: 500}
  validates :chef_id, presence: true
end