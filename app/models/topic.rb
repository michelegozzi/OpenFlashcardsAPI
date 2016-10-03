
class Topic

  include Mongoid::Document
  include Mongoid::Timestamps


  field :name, type: String
  field :description, type: String

  validates :name,      presence: true,
                        length: { maximum: 100 }
                        
  validates :description,      presence: true,
                               length: { maximum: 100 }
                        
  has_many :questions
  

end

