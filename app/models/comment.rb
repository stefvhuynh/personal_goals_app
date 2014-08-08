class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User", foreign_key: :commenter_id
  belongs_to :commentable, polymorphic: true

  validates(
    :content, :commenter_id, :commentable_id,
    :commentable_type, presence: true
  )
end
