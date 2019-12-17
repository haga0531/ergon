class RemoveUrlFromWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :url, :text
  end
end
