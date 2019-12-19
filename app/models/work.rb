class Work < ApplicationRecord
	belongs_to :user
	has_many   :likes, dependent: :destroy
	has_many :comments

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  acts_as_taggable

  attachment :image
  validates :title, presence: true
end
