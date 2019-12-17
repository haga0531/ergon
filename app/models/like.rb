class Like < ApplicationRecord
	belongs_to :work, counter_cache: :likes_count
    belongs_to :user
end
