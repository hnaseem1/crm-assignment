require './contact.rb'
class CRM

  def initialize

  end

  def main_menu

    while true # repeat indefinitely

      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)

    end

  end

  def print_main_menu

    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '

  end

  def call_option(user_selected)

  case user_selected

    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_contacts
    when 5 then search_by_attribute
    when 6 then exit

  end

  end

  def add_new_contact

  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  Contact.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    note: note)

  end

  def modify_existing_contact

    #find the instance that needs to be updated
    #return the full name using
    #confirms with a Y/N
    #asks for the new attirbutes
    #return success
    display_contacts

    puts 'Enter ID of the contact: '
    id = gets.chomp.to_i

    #Contact.all would return @contacts Array
    #iterate through @@contacts
    Contact.all.each do |contact|

      if contact.id == id
        print 'New First Name: '
        first_name = gets.chomp

        print 'New Last Name: '
        last_name = gets.chomp

        print 'New Email Address: '
        email = gets.chomp

        print 'New Note: '
        note = gets.chomp

        contact.update(
          first_name: first_name,
          last_name: last_name,
          email: email,
          note: note)
        success
      end
    end

  end

  def delete_contact

    display_contacts

    puts 'Enter ID of the contact: '
    id = gets.chomp.to_i

    Contact.all.each do |contact|
      if contact.id == id
        contact.delete
        success
      end
    end

  end

  def search_by_attribute

    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'
    puts 'Enter a number: '
    input = gets.chomp.to_i

    if input == 1
      puts "Enter the First Name: "
      value = gets.chomp
      contact = Contact.find_by(first_name: value)

    elsif input == 2
      puts "Enter the Last Name: "
      value = gets.chomp
      contact = Contact.find_by(last_name: value)
      display_contact(contact)

    elsif input == 3
      puts "Enter the Email: "
      value = gets.chomp
      contact = Contact.find_by(email: value)
      display_contact(contact)

    elsif input == 4
      puts "Enter the Note: "
      value = gets.chomp
      contact = Contact.find_by(note: value)
      display_contact(contact)

    end

  end

  def display_contacts
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts "-----------------------------------------------------------------------------"
    puts "- ID ------ Name --------- Email ------------------ Note --------------------"
    Contact.all.each do |contact|
    puts "|--#{contact.id}-----#{contact.full_name}---#{contact.email}----#{contact.note}--|"
    end
    puts "-----------------------------------------------------------------------------"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end

  def success
    puts "SUCCESSFULLY UPDATED: "
    puts " "
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end

  def display_contact(contact)
    puts "|--#{contact.id}-----#{contact.full_name}---#{contact.email}----#{contact.note}--|"
  end
end



a = CRM.new
a.main_menu

at_exit do
ActiveRecord::Base.connection.close
end
