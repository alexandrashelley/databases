require 'album_repository'

RSpec.describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do
    reset_albums_table
  end

  it 'returns all albums and their information' do
    repo = AlbumRepository.new

    albums = repo.all

    expect(albums.length).to eq 2

    expect(albums.first.id).to eq '1'
    expect(albums.first.title).to eq 'Motomami'
    expect(albums.first.release_year).to eq '2022'
    expect(albums.first.artist_id).to eq '1'

    expect(albums.last.id).to eq '2'
    expect(albums.last.title).to eq 'In Colour'
    expect(albums.last.release_year).to eq '2015'
    expect(albums.last.artist_id).to eq '2'
  end

  it 'returns one album for a given id' do
    repo = AlbumRepository.new

    album = repo.find('1')

    expect(album[0].id).to eq '1'
    expect(album[0].title).to eq 'Motomami'
    expect(album[0].release_year).to eq  '2022'
    expect(album[0].artist_id).to eq '1'
  end
end