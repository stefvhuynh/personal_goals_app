class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :shared, :completed, presence: true
  validates :user_id, presence: true, numericality: true
end
