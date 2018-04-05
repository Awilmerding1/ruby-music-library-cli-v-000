class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def genres 
   array = self.songs.map do |song|
      song.genre
    end
    array.uniq
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    unless self.songs.include?(song)
      self.songs << song
    end
    if song.artist == nil
      song.artist = self
    end
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
  
  
end
  