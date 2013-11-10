class CreateListenedSongs < ActiveRecord::Migration
  def change
    create_table :listened_songs do |t|
      t.references :user
      t.references :song, index: true

      t.timestamps
    end
  end
end
