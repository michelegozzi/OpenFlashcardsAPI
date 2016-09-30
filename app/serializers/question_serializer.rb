class QuestionSerializer < ActiveModel::Serializer
  attributes :text
  has_many :answers
end