class Comment
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :body, type: String

  belongs_to :post

  validates :name, presence: true
  validates :email, presence: true
  validates :body, presence: true
end
