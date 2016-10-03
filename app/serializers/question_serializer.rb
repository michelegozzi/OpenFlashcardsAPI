class QuestionSerializer < ActiveModel::Serializer
  attributes :text, :id
  has_many :answers
  belongs_to :topic
end