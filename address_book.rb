

## To do
#  sort
#  filter

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

        person = Person.new(0,0,0,0,0)

        person.id = get_next_id(all_people)

        puts "=========== New Record ==================\n"

        set_first_name(person)
        set_last_name(person)
        set_phone_number(person)
        set_new_address(person)

        select = 'y'
        while select.downcase == 'y'
            puts "\n Do you want to enter another address? (Y/N)\n"
            select = gets.chomp
            if select.downcase == 'y'
                set_new_address(person)
            end
        end



        all_people.push(person)
        puts "\n*********** Record Added ***************"
      when 2 # Updating a record
        puts "\n*********** Update Record ***************"

        # find Record to delete
        display_record_names(all_people)

        puts = "\n----------------\n"
        print "\nSelect ID of record to update: "
        choice = gets.chomp.to_i
        puts = "\n----------------\n"

        temp = all_people.find { |l| l.id == choice }

        index = all_people.index { |x| x.id == temp.id }  #=> 1

        # confirm that they really want to delete this record
        print "You want to update record #{temp.id}: for #{temp.full_name}? (Y/N)"

        select = gets.chomp
        if select.downcase == 'y'
          # update
          temp_arr = []
          temp_arr.push(temp)
          display_records(temp_arr)
          edit_var = true
          while edit_var == true
              ## ask what part they want to Update
              display_update_menu
              edit = gets.chomp.to_i
              case edit
                  when 1
                    set_first_name(temp)
                  when 2
                  set_last_name(temp)
                  when 3
                    set_phone_number(temp)
                  when 4

                    set_first_name(temp)
                    set_last_name(temp)
                    set_phone_number(temp)

                  when 5
                    edit_var = false
                  else
                    puts "Enter a value between 1 and 5"
              end
              all_people[index] = temp
          end
          # give message that record has been deleted
          puts "\n*********** Record Updated ***************"
        end

      when 3 # Deleteing a record
        puts "\n*********** Delete Record ***************"
        # find Record to delete
        display_record_names(all_people)

        puts = "\n----------------\n"

        print "\nSelect ID of record to delete: "
        choice = gets.chomp.to_i

        puts = "\n----------------\n"
        # to do: get ID -- have to come up with better way to retrieve ID because they might be deleted
        temp = all_people.find { |l| l.id == choice }
        # confirm that they really want to delete this record
        print "Are you sure you want to delete record #{temp.id}: for #{temp.full_name} (Y/N)"
        select = gets.chomp

        if select.downcase == 'y'
          # Delete
          all_people.delete_if  {|x| x.id == temp.id }

          # give message that record has been deleted
          puts "\n*********** Record Deleted ***************"
        end

      when 4 #Displaying a record
        # add a filter and find feature
          puts "\n*********** All Records ********************"
          display_records(all_people)
          puts "\n****** Total Records: #{all_people.length} ******\n\n\n"
          print "Return"
          gets.chomp
      when 5 # Updating data and exiting program
          puts "Bye, Bye!"
        #  display_records(all_people)
          save_records(all_people, file_name)
          picker = false
    #  when 9 #Testing
    #    puts "Next ID is : #{get_next_id(all_people)}"
      else
        puts "Please use a value between 1 and 6"
      end
end
