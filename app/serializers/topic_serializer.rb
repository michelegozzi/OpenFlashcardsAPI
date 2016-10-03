class TopicSerializer < ActiveModel::Serializer
  attributes :name, :id, :description
  has_many :questions
  
  #self.root = true
  
  def json_key
    "topics"
  end
end