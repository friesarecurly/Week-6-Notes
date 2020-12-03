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

require 'rails_helper'

RSpec.describe Song, type: :model do
  subject(:song) { Song.first }

  it "is associated with an album" do
    expect(song.album.name).to eq("Selected Ambient Works 85-92")
  end

  it "is associated with playlist tracks" do
    expect(song.playlist_tracks.first.song_id).to eq(song.id)
  end

  it "is associated with an artist" do
    expect(song.artist.name).to eq("Aphex Twin")
  end

  describe "validations" do 
    it "require song to be associated with an album" do
      is_expected.to validate_presence_of(:album).with_message(/must exist/)
    end
  end
end
