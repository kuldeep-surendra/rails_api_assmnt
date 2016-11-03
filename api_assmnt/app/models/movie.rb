class Movie < ActiveRecord::Base
	validates :title, on: :create, presence: true, uniqueness: true, length: {minimum: 2}
	validates :year, on: :create,presence: true
	validates :language, on: :create, presence: true
	validates :actors, on: :create, presence: true
	validates :director, on: :create, presence: true
	validates :producer, on: :create, presence: true
	validates :rating, on: :create, presence: true, length: {within: 1..10}
	has_many :roles
	has_many :users, through: :roles
end
