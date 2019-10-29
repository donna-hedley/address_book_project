def read_records(file_name)
  arr = []
    stuff = YAML.load(File.read(file_name))
    stuff.each do |r|
      stuff2 = r.addressess
      stuff2.each do |a|
        address = Address.new(a.kind, a.street, a.city, a.province, a.postal_code)
        person = Person.new(r.first_name, r.last_name, r.phone, r.id, 0)
        person.addressess.push(address)
        arr.push(person)
      end
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
      puts "===========================\n"
    puts " ID: #{r.id}\t"
    puts " First Name:\t#{r.first_name} "
    puts " Last Name:\t#{r.last_name}"
    puts " Phone:\t\t#{r.format_phone}"
    puts " Full Name: \t#{r.full_name}"

    if r.addressess.length > 0
  puts "\n============ ADDRESSES ==========="

          r.addressess.each do |address|
            puts address.to_s('long')


      end

    end
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
  print " 1 - Add a new record\n"
  print " 2 - Update a record\n"
  print " 3 - Delete a record\n"
  print " 4 - Display records\n"
  print " 5 - Exit program\n"
#  print " Testing 9\n"
  print "===============================\n\n\n"
end



def display_update_menu

  print "\n\n\n===============================\n"
  print " \n How do you wish to edit?\n\n"
  print "===============================\n"
  print " 1 - Edit First Name\n"
  print " 2 - Edit Last Name\n"
  print " 3 - Edit Phone\n"
  print " 4 - Edit whole record\n"
  print " 5 - Return to Main Menu\n"
  print "===============================\n"

end

def set_phone_number(person)
  phoneValid = false
  while phoneValid == false do
        print "Enter Phone (10 digit number): "
        phone = gets.chomp
        #test to see if the phone number is phoneValid.
        if phoneValid = (phone.length == 10) && phone.is_i?
          #person = Person.new(fname, lname, phone, id)
          person.phone = phone
        else
          puts "\nPlease enter a valid phone number. \n"
        end
  end
end

def set_first_name(person)
    print "Enter First Name:  "
    person.first_name = gets.chomp
end

def set_last_name(person)
  print "Enter Last Name:   "
  person.last_name = gets.chomp
end


def set_new_address(person)
  address = Address.new(0,0,0,0,0)

  print "Enter Type of Address: "
  address.kind = gets.chomp

  print "Enter Street: "
  address.street = gets.chomp

  print "Enter City: "
  address.city = gets.chomp

  print "Enter Province: "
  address.province  = gets.chomp

  print "Enter Postal Code: " # do some validation
  address.postal_code = gets.chomp

  person.addressess.push(address)
end
