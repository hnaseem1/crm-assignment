class Contact

  @@contacts = []
  @@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email = 'N/A', note = 'N/A')

      @first_name = first_name
      @last_name  = last_name
      @email      = email
      @note       = note
      @id         = @@id

    @@id += 1
  end

  #READERS

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end


  #WRITERS

  def set_first_name=(first_name)
    @first_name = first_name
  end

  def set_last_name=(last_name)
    @last_name = last_name
  end

  def set_email=(email)
    @email = email
  end

  def set_note(note)
    @note = note
  end




  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email = 'N/A', note = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    temp_contact = ""
    @@contacts.each do |contact|
      if contact.id == id
        temp_contact = contact
      else
        'not found'
      end
    end
    temp_contact
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    if attribute == "firstname"
      self.set_first_name = value
    elsif attribute == "lastname"
      self.set_last_name = value
    elsif attribute == "email"
      self.set_email = value
    elsif attribute == "note"
      self.set_note = value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    temp_contact = "Error 404 - Not Found"

    if attribute == "firstname"
      @@contacts.each do |contact|
        if contact.first_name == value
          temp_contact = contact
        end
      end

    elsif attribute == "lastname"
      @@contacts.each do |contact|
        if contact.last_name == value
          temp_contact = contact
        end
      end

    elsif attribute == "email"
      @@contacts.each do |contact|
        if contact.email == value
          temp_contact = contact
        end
      end

    elsif attribute == "note"
      @@contacts.each do |contact|
        if contact.note == value
          temp_contact = contact
        end
      end

    elsif attribute == "id"
      @@contacts.each do |contact|
        if contact.id == value
          temp_contact = contact
        end
      end

    end
    temp_contact
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "{@first_name} {@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.each do |contact|
      if contact.id == self.id
        @@contacts.delete(contact)
      end
    end
    @@contacts
  end

  # Feel free to add other methods here, if you need them.

end



#TESTING DEBUGGING

contact1 = Contact.create("Hasan", "Naseem", "hn92@live.com", "He is awesome")
contact2 = Contact.create("Taha", "Naseem")
contact3 = Contact.create("Zain", "Naseem", "zn92@live.com")
contact4 = Contact.create("Rubina", "Naseem")
contact5 = Contact.create("Aslam", "Naseem")
contact6 = Contact.create("Jamshed", "Naseem")


# p Contact.all
# p Contact.find(3)
# contact1.update("lastname", "Jacob")
# p Contact.all
# p Contact.find_by("email", "hn92@live.com")
# p Contact.find_by("lastname", "hn92@live.com")
# p Contact.find_by("id", 4)
# p Contact.find_by("firstname", "Zain")
# p Contact.find_by("note", "He is awesome")
# p contact2.delete
# Contact.delete_all
# p Contact.all
