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

  Contact.create(first_name, last_name, email, note)

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

    print 'what would you like to change(First name, last name, email or note?): '
    att = gets.chomp
    attribute = att.delete(' ').downcase

    print "Enter the new #{att}: "
    value = gets.chomp

    #Contact.all would return @contacts Array
    #iterate through @@contacts
    Contact.all.each do |contact|

      if contact.id == id
        contact.update(attribute, value)
        success
        display_contacts

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
        display_contacts
      end
    end

  end

  def search_by_attribute

    print 'what would you like to find by? (First name, last name, email or note): '
    att = gets.chomp

    attribute = att.delete(' ').downcase
    print "Whats the #{att} of the contact you would like to search: "
    value = gets.chomp

    result = Contact.find_by(attribute, value)
    if result != "Error 404 - Not Found"
      puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
      puts "------------------------------------------------"
      puts "| #{result.id} | #{result.full_name} |#{contact.email}  | #{contact.note}"
      puts "------------------------------------------------"
      puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    else
      puts "Error 404 - Not Found"
      gets.chomp
    end
  end

  def display_contacts
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    puts "-----------------------------------------------------------------------------"
    puts "- ID ------ Name --------- Email ------------------ Note --------------------"
    Contact.all.each do |contact|
    puts "| #{contact.id} | #{contact.full_name}   | #{contact.email}  | #{contact.note}"
    end
    puts "-----------------------------------------------------------------------------"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end

  def success
    puts "SUCCESSFULLY UPDATED: "
  end


end

a = CRM.new
a.main_menu
