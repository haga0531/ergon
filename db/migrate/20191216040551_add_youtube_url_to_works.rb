class AddYoutubeUrlToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :youtube_url, :string
  end
end
