# == Schema Information
#
# Table name: songs
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  length     :integer          not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ApplicationRecord

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
  
  has_many :playlist_tracks,
    primary_key: :id,
    foreign_key: :song_id,
    class_name: :PlaylistTrack

  has_one :artist,
    through: :album,
    source: :artist
end
