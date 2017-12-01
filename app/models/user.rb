class User < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :preferred_locations, dependent: :destroy

  has_many :learner_questions, class_name: 'Question', foreign_key: :learner_id
  has_many :tutor_questions, class_name: 'Question', foreign_key: :tutor_id

  has_many :learner_reviews, through: :learner_questions,  class_name: 'Review', source: :reviews
  has_many :tutor_reviews, through: :tutor_questions, class_name: 'Review', source: :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@uic\.edu\z/, message: "Please use your Organization email" }

  def self.authenticate_with_token(token)
    decoded_token = JsonWebToken.decode(token)

    raise Errors::CustomError.new 'Invalid Token' if decoded_token.blank?

    raise Errors::CustomError.new 'Token Expired' if Time.at(decoded_token[:exp]) < DateTime.now
    raise Errors::CustomError.new 'Invalid Token' if decoded_token[:user_id].blank?

    user = User.find_by_email(decoded_token[:user_id])
    raise Errors::CustomError.new 'User not found' if user.blank?
    user
  end

  def add_skills(skillset)
    skillset.each do |newskill|
      newskill = Skill.where(name: newskill).first_or_create
      skills << newskill
    end
  end

  def rating
    tutor_reviews.average(:rating)
  end
end
