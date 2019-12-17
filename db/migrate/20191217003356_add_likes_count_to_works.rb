class AddLikesCountToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :likes_count, :integer
  end
end
