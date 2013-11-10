class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.references :albums_songs, index: true
      t.references :artist, index: true
      t.integer :year

      t.timestamps
    end
  end
end
