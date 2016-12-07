require('pg')
require_relative('sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end 

  def add ()
    sql = "
    INSERT INTO artists (name) VALUES
    ('#{@name}') RETURNING *;
    "
    saved_result = SqlRunner.run(sql)
    @id = saved_result[0]['id'].to_i  
  end

  def self.all()
    sql = 
    "SELECT * FROM artists ;"
    result = SqlRunner.run(sql)
    result.map { |e| Artist.new(e)}
  end

  def self.delete_all()
    sql = 
    "DELETE FROM artists ;
    "
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = 
    "DELETE FROM artists WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    result.map{ |e| Artist.new(e)}
  end

  def delete(id)
     sql = 
     "DELETE FROM artists WHERE id = #{id};
     "
     result = SqlRunner.run(sql)
     result.map{ |e| Artist.new(e)}
  end

  def self.search(id)
    sql =
    "SELECT name FROM artists WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    result.map {|a| Artist.new(a)}
  end


  def self.update(id, new_title)
    sql = 
    "UPDATE artists SET name = '#{new_title}' WHERE id = #{id};
    "
    result = SqlRunner.run(sql)
    result.map {|a| Artist.new(a)}
  end


  def self.show_albums(id)
    @id = id
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    albums = SqlRunner.run(sql)
    albums.map {|a| Album.new(a)}
  end

  # def show_albums(id)
  #   sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
  #   albums = SqlRunner.run(sql)
  #   albums.map {|a| Album.new(a)}
  # end
end