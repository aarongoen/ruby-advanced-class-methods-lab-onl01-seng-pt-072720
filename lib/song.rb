require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    song.save 
    song 
  end 
  
  def self.new_by_name(name) 
    new_song = self.new 
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.create 
    new_song.name = name
    new_song
  end 
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end 
   
  # why doesn't the following work?
  # def self.find_by_name(name)
  #   @@all.each do |song|
  #     if song.name == name
  #     name 
  #   end 
  # end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create_by_name(name) : self.find_by_name(name)
    end 

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 
 
  def self.new_from_filename(filename)
<<<<<<< HEAD
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new 
    song.name = split_filename[1] 
    song.artist_name = split_filename[0]
    song 
    end
   
  def self.create_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new 
    song.name = split_filename[1] 
    song.artist_name = split_filename[0]
    @@all << song 
    song 
=======
    song = Song.new 
    song.name = (filename.split(" - ")[0].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[1])
    end
   
  def self.create_from_filename(filename)
    song = Song.new
    song.name = (filename.split(" - ")[0].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[1])
    @@all << song 
>>>>>>> b093051ed171a6e5bd551cccbaacdefc8e3d865b
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
end
