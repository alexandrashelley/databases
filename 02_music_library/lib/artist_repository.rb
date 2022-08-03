require_relative 'artist'

class ArtistRepository
  def all
    sql = 'SELECT * FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    artists = []

    result_set.each do |column|
      artist = Artist.new
      artist.id = column['id']
      artist.name = column['name']
      artist.genre = column['genre']

      artists << artist
    end
    
    return artists
  end

  def find(id)
    sql = 'SELECT * FROM artists WHERE id = $1;'
    params = [id]
    
    result_set = DatabaseConnection.exec_params(sql, params)

    an_artist = []

    result_set.each do |column|
      artist = Artist.new
      artist.id = column['id']
      artist.name = column['name']
      artist.genre = column['genre']

      an_artist << artist
    end

    return an_artist
  end
end