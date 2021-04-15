class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :length
      t.string :url
      t.string :source
      t.string :source_url
      t.boolean :is_active
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
