class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string, :title
      t.int, :duration
      t.reference, :user
      t.reference :artist

      t.timestamps
    end
  end
end
