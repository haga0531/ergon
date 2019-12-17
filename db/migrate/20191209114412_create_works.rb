class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.text :description
      t.string :work_image_id

      t.timestamps
    end
  end
end
