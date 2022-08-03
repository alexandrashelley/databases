require 'artist_repository'

RSpec.describe ArtistRepository do

  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do
    reset_artists_table
  end

  it 'returns all artists and their information' do
    repo = ArtistRepository.new

    artists = repo.all

    expect(artists.length).to eq 2

    expect(artists.first.id).to eq '1'
    expect(artists.first.name).to eq 'Prince'
    expect(artists.first.genre).to eq 'Pop'

    expect(artists.last.id).to eq '2'
    expect(artists.last.name).to eq 'Confidence Man'
    expect(artists.last.genre).to eq 'Electropop'
  end

  it 'returns one artist when given an id' do
    repo = ArtistRepository.new

    artist = repo.find('1')

    expect(artist[0].id).to eq '1'
    expect(artist[0].name).to eq 'Prince'
    expect(artist[0].genre).to eq 'Pop'
  end
end
