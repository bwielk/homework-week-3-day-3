require('pg')
require_relative('sql_runner')

class Album

attr_accessor :title, :genre
attr_reader :artist_id

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @id = options['id'].to_i
  @artist_id = options['artist_id'].to_i
end

def add ()
  sql = "
  INSERT INTO albums (title, genre, artist_id) VALUES
  ('#{@title}', '#{@genre}', #{artist_id}) RETURNING *;
  "
  saved_result = SqlRunner.run(sql)
  @id = saved_result[0]['id'].to_i  
end

def self.all ()
  sql = 
  "SELECT * FROM albums ;"
  result = SqlRunner.run(sql)
  result.map { |e| Album.new(e)}
end

def self.delete_all()
  sql = 
  "DELETE FROM albums ;
  "
  SqlRunner.run(sql)
end

def self.delete(id)
   sql = 
   "DELETE FROM albums WHERE id = #{id};
   "
   result = SqlRunner.run(sql)
   result.map{ |e| Album.new(e)}
end

def self.search(id)
  sql =
  "SELECT title FROM albums WHERE artist_id = #{id};
  "
  result = SqlRunner.run(sql)
  result.map {|a| Album.new(a)}
end

def self.update_genre(id, new_genre)
  sql = 
  "UPDATE albums SET genre = '#{new_title}' WHERE id = #{id};
  "
  result = SqlRunner.run(sql)
  result.map {|a| Album.new(a)}
end

def self.update(id, new_title)
  sql = 
  "UPDATE albums SET title = '#{new_title}' WHERE id = #{id};
  "
  result = SqlRunner.run(sql)
  result.map {|a| Album.new(a)}
end

def self.show_artist(num)
  @artist_id = num
  sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
  artists = SqlRunner.run(sql)
  artists.map {|a| Artist.new(a)}
end

# def show_artist()
#   sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
#   artists = SqlRunner.run(sql)
#   artists.map {|a| Artist.new(a)}
# end

end