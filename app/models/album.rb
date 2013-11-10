class Album < ActiveRecord::Base
  belongs_to :albums_songs
  belongs_to :artist
end
