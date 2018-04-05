require "pry"
class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist_object=nil, genre_object=nil)
    @name = name 
    if artist_object !=nil
      self.artist=(artist_object)
    end
    if genre_object !=nil 
      self.genre=(genre_object)
    end
  end
  
  def genre=(genre_object)
    @genre = genre_object 
    unless self.genre.songs.include?(self)
    self.genre.songs << self
  end
  end
  
  def artist=(artist_object)
    @artist = artist_object
    self.artist.add_song(self)
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear 
  end
  
  def save
    @@all << self 
  end 
  
  def self.create(song)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    array = self.all.detect do |songs|
      songs.name == name
      songs
    end
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name) 
       if song == self 
        song
    else
      self.create(song)
   end
   binding.pry
  end
  
  
end
  