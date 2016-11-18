require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'pp' #not used but handy for looking at nokogiri tree

# LOAD_URI takes an array of uri's and a flag ("actor" or "film") and searches each one
# for actors in a film or films in which the actor occurs. It gathers up the results 
# in an array that is flattened, cleaned of nils and duplicates.

def load_uris(uri_array, flag)
	puts "\nURI Array has #{uri_array.size} items"
	uri_array.collect {|uri| load_uri(uri, flag)}.flatten.compact.uniq
end

# LOAD_URI takes a single uri and a flag ("actor" or "film") and searches the page it opens.
# It returns a list of films or actors depending on the flag given; does simple error handling.

def load_uri(uri, flag)
   puts "\nChecking the following: #{strip_out_name(uri)}"
   begin
  	  doc = open(uri,:allow_redirections => :safe)
  	  rescue OpenURI::HTTPError => the_error
  	  puts "Error, found bad status code: #{the_error}" 
   end
   if the_error.instance_of?(OpenURI::HTTPError)
	   then puts "...so, we are not doing #{uri}"
   else doc = Nokogiri::HTML(open(uri, :allow_redirections => :safe))
   		if flag == "actor" then out = find_films_by_actor(doc) 
   		elsif flag == "film" then out = find_actors_in_film(doc) end
   end
   out
end
 
# FIND_FILMS_BY_ACTOR takes a parsed web page about an actor and searches for links in it that contain "film)"
# If it finds one it puts it onto the out array and then strips off the http-crap so that
# you just have the film name as a string; its is limited in that not all film names
# have the "(film)" tag on them.

def find_films_by_actor(doca, out = [])
	puts "Entering find_films_by_actor with #{find_name_title(doca)}."

	# below we defined 2 methods to look for the film / filmography table
  # this is because Wikipedia is inconsistent in the way it lists an actor's movies
  # sometimes the table is directly after a tag h2 whose name is "filmography"
  # example: https://en.wikipedia.org/wiki/Adele_Exarchopoulos
  # sometimes below that h2 tag, there is an additional h3 tag named "films"
  # example: https://en.wikipedia.org/wiki/Melinda_Dillon
  method1 = doca.search("//h3//span[contains(concat(' ', normalize-space(@id), ' '), ' Film')]/..").first
  method2 = doca.search("//h2//span[contains(concat(' ', normalize-space(@id), ' '), ' Filmography')]/..").first

  # Now we check which method is the correct one. We check which of those methods returned nil.
  # Then we select the film / filmography table
  # The method selected to look for a film looks for either an h2 or h3 tag (as appropriate) with a given id
  # 'film' or 'filmography' (as appropriate) then look for the following elements with the pattern <td><i><a>
  # This pattern seems consistent across Wikipedia
  if !method1.nil?
    filmography_links = doca.search("//h3//span[contains(concat(' ', normalize-space(@id), ' '), ' Film')]/..")
              .first
              .next_element
              .search("td/i/a")
  elsif !method2.nil?
    filmography_links = doca.search("//h2//span[contains(concat(' ', normalize-space(@id), ' '), ' Filmography')]/..")
              .first
              .next_element
              .search("td/i/a")
  end

  if filmography_links.nil?
    return out # explicit return statement in case no films were found
  end

  # collect links and get movie name
  filmography_links.collect do |link|
    film_info = link['href']
    if !(film_info.include?("redlink=1")) # exclude movies with no Wikipedia page
      out << strip_out_name(film_info)
    end
  end

  out
end
 
 
# FIND_ACTORS_IN_FILM takes a parsed web page about a film and searches for links that are actor refs.
# It does this by finding a table element that starts with "Starring" and finds some children
# nodes in the list that turn out to be the actors starring in the film.
# If it finds one it puts it onto the out array and then strips off the http-crap so that
# you just have the actors name as a string.

def find_actors_in_film(doca, out = [])
	puts "Entering find_actors_in_film with #{find_name_title(doca)}."
 	all_tables = doca.search("//tr")
 	all_tables.each do |tr_node|
	  tr_childs_less_newline_nodes = tr_node.children.select {|node| !(node.inner_text == "\n")}
	  starring_node = tr_childs_less_newline_nodes[0]
	  if starring_node.inner_text == "Starring"
	    then rest_of_childs = tr_childs_less_newline_nodes[1].children
		     rest_of_childs.each {|node| if node['href'] then out << node['href'] end}
	  end
	end
  	out.uniq.collect {|link| strip_out_name(link)}
end


# FIND_NAME_TITLE finds the part of the wikipedia page with its title.

def find_name_title(doca)
    if !doca.nil?
      then title = doca.search("//title").inner_text
		   title.gsub(" - Wikipedia, the free encyclopedia", "") end
end

# STRIP_OUT_NAME takes the various forms in which links appear in wikipedia pages
# and removes the http-wiki crap and gives you back the name of the actor or film.

def strip_out_name(name, nameout = [])
	 case
		when name =~ /^http:\/\/en.wikipedia.org\/wiki\//
             nameout = name.gsub(/http:\/\/en.wikipedia.org\/wiki\//, "")
		when name =~ /^en.wikipedia.org\/wiki\//
			 nameout = name.gsub(/en.wikipedia.org\/wiki\//, "")
		when name =~ /^\/wiki\//
			 nameout = name.gsub(/\/wiki\//, "")
     when name !=~ URI::regexp || name.nil?
       p name
			 print "URI is not right in STRIP_OUT_NAME: "; p "#{@in_uri}"
	 end
	 nameout
end

#****************************   DE DATA   *****************************   
uri1 = "http://en.wikipedia.org/wiki/Mark_Keane"						  #one that isnt an actor/film
uri2 = "http://en.wikipedia.org/wiki/Close_Encounters_of_the_Third_Kind"  #one that is a film
uri3 = "http://en.wikipedia.org/wiki/Melinda_Dillon"					  #one that is an actor
uri4 = "http://en.wikipedia.org/wiki/Flubbeo"							  #one that's not a valid wiki page
uri5 = "http://en.wikipedia.org/wiki/Kevin_Bacon"						  #one that's not a valid wiki page
uri6 = "http://en.wikipedia.org/wiki/Richard_Dreyfuss"					  # another actor
uri7 = "http://en.wikipedia.org/wiki/Bound_for_Glory_(film)"			  # another film
uri8 = "http://en.wikipedia.org/wiki/The_Man_Who_Loved_Women_(film)"      # yet another film
#****************************   DE DATA   *****************************   

actor_uris = [uri1,uri3,uri4,uri5,uri6]     # URIs that are and are not actors.
film_uris = [uri1,uri2,uri4,uri7,uri8]      # URIs that are and are not films.

#DE DATA
#p load_uris(actor_uris, "actor")
#p load_uris(film_uris, "film")

doc1 = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Adele_Exarchopoulos", :allow_redirections => :safe))

puts find_films_by_actor(doc1)
