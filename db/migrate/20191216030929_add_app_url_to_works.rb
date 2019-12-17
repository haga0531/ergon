class AddAppUrlToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :app_url, :text
  end
end
