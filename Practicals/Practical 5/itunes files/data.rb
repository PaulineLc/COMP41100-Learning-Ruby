class Databit
  attr_accessor :songs, :albums, :actors, :hashes

  def initialize
    @songs = []
    @albums = []
    @actors = []
    @hashes = Hash.new
  end

  # I am skipping all the methods defined in the slides are they are not required
  # The fact that all instance variables were defined in attr_accessor ensures that they already
  # have a getter and a setter method
  # adding additional setter methods is redundant.
  # cf: https://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby

end