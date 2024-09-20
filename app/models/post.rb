class Post
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  field :created_at, type: Time, default: ->{ Time.now }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 50 }

  has_many :comments, dependent: :destroy
end
