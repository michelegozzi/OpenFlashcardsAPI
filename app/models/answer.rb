
class Answer

  include Mongoid::Document
  include Mongoid::Timestamps


  field :text, type: String

  validates :text,      presence: true,
                        length: { maximum: 500 }

  index({ text: 1 }, { unique: true, name: "answer_unique_index" })
                        
  belongs_to :question
end

