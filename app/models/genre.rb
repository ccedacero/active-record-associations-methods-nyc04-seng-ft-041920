class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.all.select do |song|
      song.genre == self
    end.count
  end

  def artist_count
    # return the number of artists associated with the genre
    arr = Song.all.map do |song|
      song.artist
    end
    arr.uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    Song.all.map { |song| song.artist.name }
  end
end
