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

require 'rails_helper'

RSpec.describe Album, type: :model do
  subject(:album) { Album.first }

  it "is associated with an artist" do
    expect(album.artist.name).to eq("Aphex Twin")
  end

  it "is associated with songs" do
    expect(album.songs.first.album_id).to eq(album.id)
  end

  describe "validations" do 
    it "require album to be associated with an artist" do
      is_expected.to validate_presence_of(:artist).with_message(/must exist/)
    end
  end

end
