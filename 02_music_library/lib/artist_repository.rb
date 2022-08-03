require_relative 'artist'

class ArtistRepository
# Selecting all records
# No arguments
  def all
    sql = 'SELECT * FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])

    artists = []

    result_set.each do |row|
      artist = Artist.new
      artist.id = row['id']
      artist.name = row['name']
      artist.genre = row['genre']

      artists << row
    end
    
    return artists
  end
end

# artist_repository = artistRepository.new
# p artist_repository.all