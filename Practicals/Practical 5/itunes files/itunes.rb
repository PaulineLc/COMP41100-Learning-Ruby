#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require 'set'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'
require_relative 'data'

class Runner
  attr_accessor :reader, :data, :verbose

  def initialize(songs_file, owners_file, verbose=true)
    @reader = Reader.new
    @data = Databit.new
    @verbose = verbose
    if @verbose then
      puts "\nProcessing Songs from file: #{songs_file}"
    end
    data.songs = reader.read_in_songs(songs_file)

    if @verbose then
      puts "Processing Ownership from file: #{owners_file}"
    end
    data.hashes = reader.read_in_ownership(owners_file)
  end

  def launch_program
    # If there is an error in the CSV files, it will show up below

    if @verbose
      puts ''
      puts 'If there is an error in owners.csv or in songs.csv, it will be printed below (between the "***")'
      puts '***'
    end

    Util.check_song_id(@data)

    if @verbose
      puts '***'
      puts ''
    end

    if @verbose
      puts 'Building all owners...'
    end

    @data.actors = Actor.build_all(@data)

    if @verbose
      puts 'Updating songs with ownership details...'
    end

    @data.songs.each { |song| song.owners = @data.hashes[song.id] }

    if @verbose
      puts 'Building All Albums...'
    end

    @data.albums = Album.build_all(@data)

    # Given the name of a song and a person; let them buy the song
    if @verbose
      puts "\nRCA buys Vaka..."
    end
    song1 = Util.fetch(@data, 'Vaka')
    rca = Util.fetch(@data, 'RCA')

    if @verbose
      rca.to_s
      song1.to_s
    end

    rca.buys_song(song1)

    if @verbose
      song1.to_s
    end

    # What songs does RCA own
    if @verbose
      puts "\nHow many songs does RCA own..."
      p rca.what_songs_does_he_own(@data).size
    end

    if @verbose
      puts "\nPlay Vaka..."
    end

    song1.play_song

    # Print out all songs
    if @verbose
      puts "\nPrinting full details of all songs..."
      @data.songs.each { |song| p song }
    end

    # Print out all albums
    if @verbose
      puts "\nPrinting full details of all albums..."
      @data.albums.each { |album| p album }
    end

  end
end


#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line

songs_file = 'songs.csv' #in RubyMine
owners_file = 'owners.csv' #in RubyMine

my_program = Runner.new(songs_file, owners_file)
my_program.launch_program

# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv
