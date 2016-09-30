
class Question

  include Mongoid::Document
  include Mongoid::Timestamps


  field :text, type: String

  validates :text,      presence: true,
                        length: { maximum: 500 }
                        
  has_many :answers
end

