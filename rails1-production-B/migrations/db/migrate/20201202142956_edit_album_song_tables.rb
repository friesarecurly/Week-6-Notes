class EditAlbumSongTables < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :year, :integer, null: false
    add_index :albums, :artist_id

    rename_column :songs, :title, :name
    add_index :songs, :name
    remove_column :songs, :artist_id
  end
end
