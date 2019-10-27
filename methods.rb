def read_records(file_name)
  arr = []
    stuff = YAML.load(File.read(file_name))
    stuff.each do |r|
      person = Person.new(r.first_name, r.last_name, r.phone, r.id)
      arr.push(person)
    end
    return arr
end



def save_records(records, file_name)


    if File.file?(file_name)==true
      # "FILE EXISTS"
        output = File.new(file_name, 'w')
    else
      #print "FILE DOES NOT EXISTS"
        output = File.update(file_name, 'w')
    end
      output.puts YAML.dump(records.sort_by{ |id| id.id })
      output.close
end


def display_records(arr)
  puts "\n==========================="
  arr.each_with_index do |r, i|
    puts " Record #{i+1} of #{arr.length}"
    puts " ID: #{r.id}\t"
    puts " First Name:\t#{r.first_name} "
    puts " Last Name:\t#{r.last_name}"
    puts " Phone:\t\t#{r.format_phone}"
    puts " Full Name: \t#{r.full_name}"
    puts "============================"
  end
end

# find the next available # ID
# there can be no duplicate ids
# some IDs may no longer exist

# TO DO: check for duplication
# throw an error if dup is found
def get_next_id(arr)
  # tests to see if this is the first time running. If not, id will be set to 1
  # if there are previous records, take the ID of the last record and increment by one
  if arr.length == 0
     id = 1
  else
    id =  arr.sort_by{ |id| id.id }[-1].id + 1
  end
  return id
end


def display_record_names(arr)
  puts "\n==============================================="
  arr.each_with_index do |r, i|
    puts " ID:#{r.id}\t Full Name: \t#{r.full_name}"
    puts "_______________________________________________\n"
    # to do: add order_by
  end
end

def display_main_menu

  print "\n\n\n===============================\n"
  print "         Main Menu\n"
  print "===============================\n"
  print " \n What do you want to do?\n\n"
  print "===============================\n"
  print " To add a new person, press 1\n"
  print " To update a person, press 2\n"
  print " To delete a  person, press 3\n"
  print " To display a person, press 4\n"
  print " To display all people, press 5\n"
  print " To exit, press 6\n"
  print " Testing 9\n"
  print "===============================\n\n\n"



end
