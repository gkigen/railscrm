class CreateOpportunities < ActiveRecord::Migration
  def up
    create_table :opportunities do |t|
      t.string "name"
      t.string "account"
      t.string "salesstage"
      t.integer "leadsource"
      t.string "nextstep"
      t.string "ammount"
      t.string "description"
      t.timestamps 
    end
  end

  def down
    drop_table :opportunities
  end
end
