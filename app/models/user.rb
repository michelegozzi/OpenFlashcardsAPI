
class User

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  include Mongoid::Document
  include Mongoid::Timestamps

  field :id, type: String
  #field :token, type: String
  field :name, type: String
  field :email, type: String
  #field :login_type, type:

  validates :id, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #validates :token, presence: true, length: { maximum: 500 }
                        
  #index({ id: 1, token: 1 }, { unique: true, name: "user_unique_index" })
  
  has_many :api_keys

end

