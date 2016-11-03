class User < ActiveRecord::Base

	validates :name,on: :create, presence: true
	validates :age,on: :create, presence: true
	validates :role,on: :create, presence: true
	validates :gender,on: :create, presence: true
	has_one :roles
	has_many :movies, through: :roles
end
