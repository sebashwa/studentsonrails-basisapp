class ListenedSong < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
end
