gem 'activerecord', '=4.2.7'
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

# contact1 = Contact.create(
#   first_name: "Hasan",
#   last_name: "Naseem",
#   email: "hn92@live.com",
#   note: "He is awesome")
# contact2 = Contact.create(
#   first_name: "Taha",
#   last_name: "Naseem",
#   email: "hn92@live.com",
#   note: "He is awesome")
# contact3 = Contact.create(
#   first_name: "Zain",
#   last_name: "Naseem",
#   email: "hn92@live.com",
#   note: "He is awesome")
# contact4 = Contact.create(
#   first_name: "Rubina",
#   last_name: "Naseem",
#   email: "hn92@live.com",
#   note: "He is awesome")
# contact5 = Contact.create(
#   first_name: "Hasan",
#   last_name: "Naseem",
#   email: "hn92@live.com",
#   note: "He is awesome")
# contact6 = Contact.create(
#   first_name: "Hasan",
#   last_name: "Naseem",
#   email: "hn92@live.com",
#   note: "He is awesome")


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
