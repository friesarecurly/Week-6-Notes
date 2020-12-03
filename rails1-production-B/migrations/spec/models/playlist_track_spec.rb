require 'rails_helper'

RSpec.describe PlaylistTrack, type: :model do
  it "table exists" do 
    expect { PlaylistTrack.new }.not_to raise_error(ActiveRecord::StatementInvalid)
  end

  describe "'playlist_id' column" do
    it "exists with a type of 'integer'" do 
      expect(PlaylistTrack.column_names).to include('playlist_id')
      expect(PlaylistTrack.column_for_attribute('playlist_id').type).to eq(:integer)
    end

    it "has a 'not null' constraint" do 
      expect(PlaylistTrack.column_for_attribute('playlist_id').null).to be(false)
    end 

    it "is indexed" do 
      expect(ActiveRecord::Base.connection.index_exists?(:playlist_tracks, :song_id)).to be(true)
    end
  end

  describe "'song_id' column" do
    it "exists with a type of 'integer'" do 
      expect(PlaylistTrack.column_names).to include('song_id')
      expect(PlaylistTrack.column_for_attribute('song_id').type).to eq(:integer)
    end
  
    it "has a 'not null' constraint" do 
      expect(PlaylistTrack.column_for_attribute('song_id').null).to be(false)
    end 
  
    it "is indexed" do 
      expect(ActiveRecord::Base.connection.index_exists?(:playlist_tracks, :song_id)).to be(true)
    end
  end

  describe 'timestamps' do
    it "columns are included ('created_at' and 'updated_at')" do
      expect(PlaylistTrack.column_names).to include('created_at')
      expect(PlaylistTrack.column_for_attribute('created_at').type).to eq(:datetime)
      expect(PlaylistTrack.column_names).to include('updated_at')
      expect(PlaylistTrack.column_for_attribute('updated_at').type).to eq(:datetime)
    end
  end
 
  it 'table has no additional columns' do
    expect(PlaylistTrack.column_names).to contain_exactly('id','playlist_id','song_id','created_at','updated_at')
  end
end
