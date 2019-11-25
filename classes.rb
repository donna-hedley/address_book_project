# frozen_string_literal: true

# classes used in address_book.rb

class Person
  @@people_count = 0

  attr_accessor :first_name, :last_name, :phone, :id, :addressess
  def initialize(first_name, last_name, phone, id, addressess)
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
        address += ' ' + street
      end
      address += ", #{city}, #{province}, #{postal_code}"
    end
    address
  end
end

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts 'Contact List'
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end