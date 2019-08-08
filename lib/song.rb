class Song
  # create class variables to later return information about all Songs
  @@count = 0
  @@artists = []
  @@genres = []

  # let program read & write to all instance values below
  attr_accessor :name, :artist, :genre

  def initialize(name, artist, genre)
    # assign values of required arguments to each new instance
    @name = name
    @artist = artist
    @genre = genre
    # modify class variables with each new instance
    @@count += 1
    @@artists << artist
    @@genres << genre
  end

  # return total instances of Song class
  def self.count
    @@count
  end

  # return array of all unique artists on instances of Song class
  def self.artists
    @@artists.uniq
  end

  # return array of all unique genres on instances of Song class
  def self.genres
    @@genres.uniq
  end

  # helper method to populate a hash with pattern "unique value => number of instances of that value"
  def self.count_hash(value_array)
    value_array.each_with_object(Hash.new(0)) do |val, hash|
      hash[val] += 1
    end
  end

  # hash of how many times a given genre appears on all Song instances
  def self.genre_count
    count_hash(@@genres)
  end

  # hash of how many times a given artist appears on all Song instances
  def self.artist_count
    count_hash(@@artists)
  end
end
