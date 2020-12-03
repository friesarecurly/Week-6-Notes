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

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.first }

  it "is associated with playlists" do
    expect(user.playlists.first.name).to eq("Good Songs")
  end

  # This association is different than playlist tracks
  it "is associated with playlist songs" do
    album_id = Album.first.id
    expect(user.playlist_songs.first.album_id).to eq(album_id)
  end
end
