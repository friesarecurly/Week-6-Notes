# == Schema Information
#
# Table name: playlists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Playlist, type: :model do
  subject(:playlist) { Playlist.first }

  it "is associated with a user" do
    expect(playlist.user.username).to eq("ricky")
  end

  it "is associated with playlist tracks" do
    expect(playlist.playlist_tracks.first.playlist_id).to eq(playlist.id)
  end

  it "is associated with songs" do
    album_id = Album.first.id
    expect(playlist.songs.first.album_id).to eq(album_id)
  end

  it "is associated with albums" do
    album_id = Album.first.id
    expect(playlist.albums.first.id).to eq(album_id)
  end

  it "is associated with artists" do
    expect(playlist.artists.first.name).to eq("Aphex Twin")
  end

  describe "validations" do 
    it "require playlist to be associated with a user" do
      is_expected.to validate_presence_of(:user).with_message(/must exist/)
    end
  end
end
