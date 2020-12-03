# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject(:artist) { Artist.first }

  it "is associated with albums" do
    expect(artist.albums.first.name).to eq("Selected Ambient Works 85-92")
  end

  it "is associated with songs" do
    album_id = Album.first.id
    expect(artist.songs.first.album_id).to eq(album_id)
  end

end
