require_relative('../db/sql_runner')

class Patron

    attr_reader :id, :username, :bio

def initialize( options )
    @id = options['id'].to_i if options['id']
    @username = options['username']
    @bio = options['bio']
end #initialize

def save()
    sql = "INSERT INTO patrons (username,bio) VALUES ($1,$2) RETURNING id"
    values = [@username, @bio]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
end #save

def find(id)
   
end #find

def self.show_all
   
    #sends back new patron objects, created from hash values, from table search 
end #self show all

def delete_by_id
    
end #delete_by_id

def self.delete_all
    
end #self delete all
#TO DO

def link_persona_id_to_recipe
    #search for recipes by person id
    end 

end #class end