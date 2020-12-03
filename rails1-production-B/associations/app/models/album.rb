# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  year       :integer          not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artist

  has_many :songs,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Song
  
end
