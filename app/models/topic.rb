
class Topic

  include Mongoid::Document
  include Mongoid::Timestamps
  # include Mongoid::Enum
  # enum :status, [:public, :private]

  field :name, type: String
  field :description, type: String

  validates :name,      presence: true,
                        length: { maximum: 100 }
                        
  validates :description,      presence: true,
                               length: { maximum: 1000 }
                        
  has_many :questions
  
  scope :starts_with, -> (name) { where(:name => /^#{name}/) }
  scope :ends_with, -> (name) { where(:name => /#{name}$/) }
  scope :contains, -> (name) { where(:name => /#{name}/) }

end

