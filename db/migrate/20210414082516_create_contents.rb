class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :item_type
      t.string :title
      t.text :description
      t.string :language
      t.string :length
      t.datetime :date
      t.text :content_info
      t.integer :pg
      t.string :url
      t.string :source
      t.string :source_url
      t.boolean :is_active

      t.timestamps
    end
  end
end
