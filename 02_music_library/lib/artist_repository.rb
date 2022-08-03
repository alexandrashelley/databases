require_relative 'artist'

class ArtistRepository
  def all
    sql = 'SELECT * FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    artists = []

    result_set.each do |row|
      artist = Artist.new
      artist.id = row['id']
      artist.name = row['name']
      artist.genre = row['genre']

      artists << artist
    end
    
    return artists
  end
end