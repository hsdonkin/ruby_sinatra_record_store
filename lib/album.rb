require('pry')

class Album
  attr_accessor :name

  @@albums = {}
  @@rows = 0

  def initialize(name)
    @name = name
  end

  def id
    @id
  end

  def self.all()
    @@albums
  end

  def save()
    @@albums.merge!(self.name => self)
    @id = @@rows
    @@rows += 1
  end

  def self.find(name)
    @@albums[name]
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@rows = 0
  end

  def update(x)
     @@albums[x]= @@albums.delete(@name)
     @@albums[x].name = x
   end

   def delete (name)
     @@albums.delete(name)
   end

   def self.rows
     @@rows
   end

end

album1 = Album.new("Blue Album").save
album2 = Album.new("Demon Days").save
album3 = Album.new("Is This It").save
album4 = Album.new("Demon Days").save
