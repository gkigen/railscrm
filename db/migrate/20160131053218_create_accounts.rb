class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string "company"
      t.string "address"
      t.string "email"
      t.integer "mobile"
      t.string "industry"
      t.string "county" 
      t.timestamps 
    end
  end

  def down
    drop_table :accounts
  end
end
