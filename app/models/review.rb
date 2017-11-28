class Review < ApplicationRecord
    belongs_to :question
    # belongs_to :learner, class_name: 'User', foreign_key: :learner_id
    # belongs_to :tutor, class_name: 'User', foreign_key: :tutor_id, optional: true
end
