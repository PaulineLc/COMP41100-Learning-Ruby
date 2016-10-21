#!/usr/bin/ruby -w
# ALBUM
# Copyright Mark Keane, All Rights Reserved, 2014

# Class that encodes details of an album.
class Album
	attr_accessor :name, :tracks, :length, :artist,:owners, :id
	def initialize(name, tracks, length, artist, owners)
		@name = name
		@tracks = tracks
		@length = length
		@artist = artist
    @owners = owners
		@id = name.object_id
	end

  # Method that prints out the contents of an album object nicely.
	def to_s
		puts "The album #{@name} by #{@artist}. \n"
	end	

  # Method that checks if an object given to it is an album.
	def isa?
		instance_of?(Album)
	end

  # Method makes an album object; just uses Album.new; really
  # just being a bit explicit and obvious.

	def self.make_album(name,tracks, length, artist, owners)
		Album.new(name, tracks, length, artist, owners)
	end

  # Class Method that builds albums from song object's contents.
  # It returns an array of album objects.  It calls another class method that
  # builds a single album, given the name of that album.

  def self.build_all(albums = [])
		#take album names from the songs
		#call build_an_album_called to build the album
		#add that album to the array
		#return array of albums
    album_names = []
    $songs.each{|song| album_names << song.album}
    album_names.uniq!.each{|album_name| albums << build_an_album_called(album_name)}
    #p albums
    albums
  end

  # Class method that takes an album name, it finds all the sounds that are in that album
  # builds up arrays of the song-names (tracks), runtimes, artist names.  These all get used
  # to populate the various attributes of the album object.

  def self.build_an_album_called(album_name)
    #Take album name
    #Look for song with that album name
    #Create it with self.make_album
    tracks, length, artist, owners = [], 0, [], []
    $songs.each do |song|
      if song.album == album_name
        tracks << song.name
        length += song.time
        artist.include?(song.artist)? artist : artist << song.artist
        #artist and owners are built as an array because an album can have many artists.
        # e.g. Greatest Hits 1990s will have Wonderwall by Oasis, Git It Away by The Red Hot Chili Peppers....
        owners.include?(song.owners)? owners : owners << song.owners
      end
    end

    make_album(album_name,tracks,length,artist,owners)
  end

end
