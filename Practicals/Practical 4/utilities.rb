#!/usr/bin/ruby -w
# UTILITIES
# Copyright Mark Keane, All Rights Reserved, 2014
# This is fairly crap...

# This module takes a string-name of a song/actor/album and returns the structure with that name.
# Otherwise, it throws errors of different kinds for not finding anything or finding two
# structures with the submitted name.
module Util
   #will fetch object give string that is its name
   def self.fetch(string_item, out = [])
       all = $songs + $actors #+ $albums
	     found = all.select{|obj| string_item == obj.name}
       if found.size == 0
         then MyErr.new("not_found_error", string_item, "fetch").do_it
       elsif   found.size > 1
         then  MyErr.new("multiple_answer_error", string_item, "fetch").do_it
       elsif  found.size == 1
         then   found.first
       end
   end

   def self.check_song_id(songs_csv_ids = [], owners_csv_ids = [])
     $songs.each{|song| songs_csv_ids << song.id}
     owners_csv_ids += $hash_owners.keys
     if songs_csv_ids != songs_csv_ids.uniq
       then MyErr.new("song referenced twice in songs.csv",
                      songs_csv_ids.map{|song| song if songs_csv_ids.count(song) > 1}.uniq - [nil], #this  will point out the song reference twice
                      "check_song_id").do_it
     end
     if songs_csv_ids != owners_csv_ids
       then MyErr.new("Missing reference in owners.csv or songs.csv",
                      (songs_csv_ids - owners_csv_ids) + (owners_csv_ids - songs_csv_ids), #song missing from either file
                      "check_song_id").do_it
     end
   end

end


class Array
  def clean_up()
    # self.join(" ").split(" ").uniq   #this could be more elegant
    self.inject(Set.new){|my_set, element| my_set.add(element)}
  end
end

