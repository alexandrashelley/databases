require_relative 'album'

class AlbumRepository
  def all
    sql = 'SELECT * FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |row|
      album = Album.new
      album.id = row['id']
      album.title = row['title']
      album.release_year = row['release_year']
      album.artist_id = row['artist_id']

      albums << album
    end
    
    return albums
  end

  def find(id)
    sql = 'SELECT * FROM albums WHERE id = $1;'     # $1 is a placeholder param
    params = [id]

    result_set = DatabaseConnection.exec_params(sql, params)
    
    an_album = []

    result_set.each do |row|
      album = Album.new     # this is calling a new album object, then assigning lines 32-35 to it
      album.id = row['id']
      album.title = row['title']
      album.release_year = row['release_year']
      album.artist_id = row['artist_id']

      an_album << album
    end
    
    an_album
  end
end