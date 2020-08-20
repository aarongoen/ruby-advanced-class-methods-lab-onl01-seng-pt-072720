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
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
end
