class CreateAlbumsSongs < ActiveRecord::Migration
  def change
    create_table :albums_songs do |t|
      t.references :album
      t.references :song
    end
  end
end
