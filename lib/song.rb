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

  # .create
  # instantiates and saves the song, and it returns 
  # the new song that was created

  def self.create
    song = self.new  #Song.new 
    song.save 
    song
  end 

  # .new_by_name
  # instantiates a song with a name property

  def self.new_by_name(song_name) 
    song = self.new
    song.name = song_name
    song 
  end 


  # .create_by_name
  # instantiates and saves a song with a name property 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name 
    song 
  end 

  # .find_by_name
  #   can find a song present in @@all by name
  #   returns falsey when a song name is not present in @@all

  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end 


  # .find_or_create_by_name
  # invokes .find_by_name and .create_by_name instead of repeating code

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  # .alphabetical
  # returns all the song instances in alphabetical order by song name

  def self.alphabetical
    @@all.sort_by {|song_name| song_name.name}
  end 


  # .new_from_filename
  # initializes a song and artist_name based on the filename format

  def self.new_from_filename(file_name)
    sections = file_name.split(" - ")
    artist_name = sections[0]
    song_name = sections[1].gsub(".mp3", "")


    song = self.new
    song.artist_name = artist_name
    song.name = song_name 
    song
  end 

  def self.create_from_filename(file_name) 
    sections = file_name.split(" - ")
    artist_name = sections[0]
    song_name = sections[1].gsub(".mp3", "")


    song = self.create
    song.artist_name = artist_name
    song.name = song_name 
    song
  end 


  def self.destroy_all
    @@all.clear

  end 




end
