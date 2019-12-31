class Work < ApplicationRecord
	belongs_to :user
	has_many   :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  acts_as_taggable
  paginates_per 4

  attachment :image
  validates :title, presence: true
  validates :description, presence: true
  # validates :work_image_id, presence: true
  validates :app_url, presence: true
end
