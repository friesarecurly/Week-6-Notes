# == Schema Information
#
# Table name: playlist_tracks
#
#  id          :bigint           not null, primary key
#  playlist_id :integer          not null
#  song_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe PlaylistTrack, type: :model do
  subject(:playlist_track) { PlaylistTrack.first }

  it "is associated with a playlist" do
    expect(playlist_track.playlist.name).to eq("Good Songs")
  end

  it "is associated with a song" do
    expect(playlist_track.song.id).to eq(playlist_track.song_id)
  end

  describe "validations" do 
    it "require playlist track to be associated with a playlist" do
      is_expected.to validate_presence_of(:playlist).with_message(/must exist/)
    end

    it "require playlist track to be associated with a song" do
      is_expected.to validate_presence_of(:song).with_message(/must exist/)
    end
  end
  
end
