class User < ApplicationRecord
  has_many :user_skills
  has_many :skills, through: :user_skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@uic\.edu\z/, message: "Please use your Organization email" }
end
