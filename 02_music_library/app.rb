require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect('music_library')

album_repository = AlbumRepository.new
artist_repository = ArtistRepository.new

album_repository.all.each do |album|
  p album
end

artist_repository.all.each do |artist|
  p artist
end

album_repository.find('2').each do |album| 
  p album.title
end

artist_repository.find('1').each do |artist|
  p artist.name
end