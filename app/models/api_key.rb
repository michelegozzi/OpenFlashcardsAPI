
class ApiKey

  
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :generate_access_token
  
  field :access_token, type: String
  #field :expiration, type: Datetime

  validates :access_token, presence: true
  
  belongs_to :user
  
  #private
  
    def generate_access_token
      begin
        access_token = SecureRandom.hex
        self.access_token = access_token
      end while self.class.where(:access_token => access_token).count != 0
    end

end

