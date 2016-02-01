class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string "company"
      t.string "firstname"
      t.string "lastname"
      t.string "address"
      t.string "email"
      t.integer "mobile"
      t.string "industry"
      t.string "leadsource"
      t.string "county" 
      t.timestamps 
    end
  end  
  
  def down
    drop_table :contacts
  end   
end