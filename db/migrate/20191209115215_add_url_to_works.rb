class AddUrlToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :url, :text
  end
end
