class CreateContentGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :content_genres do |t|
      t.references :content, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
