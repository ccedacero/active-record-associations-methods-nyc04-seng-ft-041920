class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    Song.all.map do |song|
      song.genre.name
    end[0]
  end

  def drake_made_this
    # check if artist exists, if not, create drake artist, assign drake as the song artist
    artist = Artist.all.find_by_name("Drake")
    if !artist
      artist = Artist.create(name: "Drake")
    end
    self.artist = artist
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*

  end
end
