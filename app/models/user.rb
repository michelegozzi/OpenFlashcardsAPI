
class User

  include Mongoid::Document
  include Mongoid::Timestamps


  field :id, type: String
  field :token, type: String
  field :name, type: String

  validates :id, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :token, presence: true, length: { maximum: 500 }
                        
  index({ id: 1, token: 1 }, { unique: true, name: "user_unique_index" })
  

end

