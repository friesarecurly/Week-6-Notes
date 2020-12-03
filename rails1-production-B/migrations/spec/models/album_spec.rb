require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "'year' column" do
    it "has been added with a type of 'integer'" do 
      expect(Album.column_names).to include('year')
      expect(Album.column_for_attribute('year').type).to eq(:integer)
    end

    it "has a 'not null' constraint" do 
      expect(Album.column_for_attribute('year').null).to be(false)
    end 
  end

  describe "'artist_id' column" do
    it "has had an index added" do 
      expect(ActiveRecord::Base.connection.index_exists?(:albums, :artist_id)).to be(true)
    end
  end
  
end
