Coffee Class

def link_recipe_id_to_person
#search for recipes by person id
end 

scratch

<h4> 
<% for patron in @patrons %>
<p>Patron: <%= patron.instance_variables %> </p>
<% end%>
</h4>

<h4>
<% for recipe in @recipes %>
<p>Recipe: <%= recipe.instance_variables %> </p>
<% end%>

</h4>


<h4>
<% for review in @reviews %>
<p>Review: - <%= review.instance_variables %> </p>
<% end%>
</h4>
