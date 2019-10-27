

## To do
#  sort
#  separte into files
#  read from a File.read(
# read from database??

require 'yaml'
require_relative 'classes.rb'
require_relative 'methods.rb'

## initialize varilables
fname = ''
lname = ''
phone = ''
file_name = 'people_data.yml'
all_people = read_records(file_name)


# display menu items until user exits
picker = true
while picker do
    display_main_menu
    choice = gets.chomp.to_i
    case choice
    when 1 # Adding new record
        #get values from user
        puts "New Record\n"
        print "Enter First Name:  "
        fname = gets.chomp
        print "Enter Last Name:   "
        lname = gets.chomp
        phoneValid = false
        while phoneValid == false do
          print "Enter Phone (10 digit number): "
          phone = gets.chomp

          #this is here for testing -- don't forget to remove
        #  phone = "1231231234"

          # tests to see if this is the first time running. If not, id will be set to 1
          # if there are previous records, take the ID of the last record and increment by one
          if all_people.length == 0
             id = 1
          else
            id =  all_people[-1].id + 1
          end

          #test to see if the phone number is phoneValid.
          #
          if phoneValid = (phone.length == 10) && phone.is_i?
            person = Person.new(fname, lname, phone, id)
            all_people.push(person)
          else
            puts "\nPlease enter a valid phone number. \n"
          end
        end
        puts "\n*********** Record Added ***************"
      when 2 # Updating a record
          puts "Update Record"


          # Show list of records displaying ID and Name
          display_record_names(all_people)

          puts = "\n----------------\n"
        #  display_records(all_people.select{|x| x.id == id})


          puts "\nEnter ID of record to update?"
          choice = gets.chomp.to_i

          puts = "\n----------------\n"
          puts "you selected record #{choice}"

          # display the full record here

          edit_var = true
          while edit_var == true
              print " \n What do you want to do?\n\n"
              print "===============================\n"
              print " To edit First Name, press 1\n"
              print " To edit Last Name, press 2\n"
              print " To edit Phone, press 3\n"
              print " To edit all, press 4\n"
              print " To cancel, press 5\n"
              print "===============================\n"

              edit = gets.chomp.to_i
              case edit
                  when 1
                    puts "Edit first Name"
                  when 2
                    puts "edit last name"
                  when 3
                    puts "edit phone number"
                  when 4
                    puts "edit all"
                  when 5
                    print "Return to Main Menu"
                    edit_var = false
                  else
                    puts "Enter a value between 1 and 5"
              end
          end


        # ask what they want to Update


        # get change


        # confirm change


        # make change


        # display change

        # give message that update has been done

      when 3 # Deleteing a record

        # find Record


        # confirm delete


        # Delete


        # give message that record has been deleted

        puts "\n*********** Record Deleted ***************"
      when 4 # Finding a REcord
        puts "Find Record"
        # prompt for search value


        # print out found Record


        # give message if record is not found

      when 5 #Displaying a record
        puts "\n*********** All Records ********************"
        display_records(all_people)
        puts "\n****** Total Records: #{all_people.length} ******\n\n\n"
      when 6 # Updating data and exiting program
          puts "Bye, Bye!"
          save_records(all_people, file_name)
          picker = false
      else
        puts "Please use a value between 1 and 6"
      end
end
