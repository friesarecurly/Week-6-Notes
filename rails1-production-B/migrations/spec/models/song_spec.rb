require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "'title' column" do
    it "has been renamed to 'name'" do 
      expect(Song.column_names).to include('name')
      expect(Song.column_names).not_to include('title')
    end

  end
  describe "'name' column" do
    it "has had an index added" do 
      expect(ActiveRecord::Base.connection.index_exists?(:songs, :name)).to be(true)
    end
  end

  describe "'artist_id' column" do
    it "has been removed" do 
      expect(Song.column_names).not_to include('artist_id')
    end
  end

end
