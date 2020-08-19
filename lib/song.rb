class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = Song.new
    song.save 
    song 
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(string) 
    new_song = Song.new 
    new_song.name = string
    new_song
  end 
  
  def self.create_by_name(string)
    string = @song 
    string.save
    string
  end 
  
  def self.find_by_name(string)
     @@all.find do |name|
       Song.name == string
       string
     end 
  end 
end
