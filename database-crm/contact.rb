require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end
Contact.auto_upgrade!



#TESTING DEBUGGING

# contact1 = Contact.create("Hasan", "Naseem", "hn92@live.com", "He is awesome")
# contact2 = Contact.create("Taha", "Naseem")
# contact3 = Contact.create("Zain", "Naseem", "zn92@live.com")
# contact4 = Contact.create("Rubina", "Naseem")
# contact5 = Contact.create("Aslam", "Naseem")
# contact6 = Contact.create("Jamshed", "Naseem")


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
