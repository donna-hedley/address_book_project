class Person
      @@people_count = 0

      attr_accessor :first_name, :last_name, :phone, :id, :addressess
      def initialize(first_name="", last_name="", phone="", id=0, addressess)
        @first_name = first_name
        @last_name = last_name
        @phone = phone
        @id = id
        @addressess = []
        @@people_count += 1
      end

      def first_name
        @first_name
      end

      def id
        @id
      end

      def addressess
        @addressess
      end

      def last_name
        @last_name
      end

      def phone
        @phone
      end

      def full_name
        @first_name + " " + @last_name
      end

      def format_phone
        "(#{@phone[0..2]}) #{@phone[3..5]}-#{@phone[6..9]}"
      end

      def self.number_of_instances
      # Return your class variable on line 13
       @@people_count
     end

end


class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end


class Address
  attr_accessor :kind, :street, :city, :province, :postal_code

  def initialize(kind, street, city, province, postal_code)
    @kind = kind
    @street = street
    @city = city
    @province = province
    @postal_code = postal_code
  end

  def kind
    @kind
  end

  def to_s(format = 'short')
    address = ''
    case format
    when 'long'
      address += street + "\n" if !street.nil?
      address += "#{city}, #{province} #{postal_code}"
    when 'short'
      address += "#{kind}: "
      if street
        address += " " + street
      end
      address += ", #{city}, #{province}, #{postal_code}"
    end
    address
  end
end

=begin
home = Address.new
home.kind = "Home"
home.street_1 = "123 Main St."
home.city = "Portland"
home.state = "OR"
home.postal_code = "12345"

puts home.to_s('short')
puts "\n"
puts home.to_s('long')

=end



#require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end
=begin
address_book = AddressBook.new

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Seifer"
jason.add_phone_number("Home", "123-456-7890")
jason.add_phone_number("Work", "456-789-0123")
jason.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")

nick = Contact.new
nick.first_name = "Nick"
nick.last_name = "Pettit"
nick.add_phone_number("Home", "222-222-2222")
nick.add_address("Home", "222 Two Lane", "", "Portland", "OR", "12345")

address_book.contacts.push(jason)
address_book.contacts.push(nick)

address_book.print_contact_list

=end
