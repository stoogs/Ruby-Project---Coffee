require_relative('../db/sql_runner')

class Patron
attr_reader :id, :username, :bio

def initialize( options )
    @id = options['id'].to_i if options['id']
    @username = options['username']
    @bio = options['bio']
end #initialize

def save() #OK
    sql = "INSERT INTO patrons (username,bio) VALUES ($1,$2) RETURNING id"
    values = [@username, @bio]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
end #save

def self.find_by_id(id) #OK
   sql = "SELECT * FROM patrons WHERE id = $1" 
   values = [id]
   result = SqlRunner.run(sql,values)
   p result.first
   return Patron.new(result.first) #returns hash in 1 deep array
end #self.find

def self.show_all #OK - returns objects
   sql = "SELECT * FROM patrons"
   patrons_list = SqlRunner.run(sql)
   return patrons_list.map {|patron| Patron.new(patron)}
    #sends back new patron objects, created from hash values, from table search 
end #self.show_all

def update()
    sql = "UPDATE patrons SET (username,bio) = ($1,$2) WHERE id = $3"
    values = [@username, @bio, @id]
    SqlRunner.run(sql, values)
  end
  
def delete_by_id #OK
    sql = "DELETE FROM patrons WHERE id = $1 "
    values = [@id]
    SqlRunner.run(sql,values)
end #delete_by_id

def self.delete_all #OK
        sql = "DELETE FROM patrons"
        SqlRunner.run(sql)
end #self delete all

# def link_persona_id_to_recipe #---------------------NOT OK ******************
#     sql = "SELECT patrons.* FROM patrons
#     INNER JOIN reviews
#     ON reviews.id = patrons.id
#     WHERE patrons.id = $1"
#     values = [@id]
#     result = SqlRunner.run(sql,values)
#     p result.first
#     #search for recipes by person id
# end 

end #class end