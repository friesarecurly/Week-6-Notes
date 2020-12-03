# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  
  has_many :playlists,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Playlist

  has_many :playlist_songs,
    through: :playlists,
    source: :songs

end
