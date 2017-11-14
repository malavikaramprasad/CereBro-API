class Question < ApplicationRecord
  belongs_to :tag, class_name: 'Skill', foreign_key: :tag_id
  belongs_to :learner, class_name: 'User', foreign_key: :learner_id
  belongs_to :tutor, class_name: 'User', foreign_key: :tutor_id

  validates :description, presence: true
  validates :learner, presence: true, uniqueness: { scope: :tutor }
  validates :tag, presence: true
end
