class AddImageIdToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :image_id, :string
  end
end
