class AnswerSerializer < ActiveModel::Serializer
  attributes :text
  belongs_to :question
end