class CreateLeads < ActiveRecord::Migration
  def up
    create_table :leads do |t|
      t.string "company"
      t.string "address"
      t.string "email"
      t.integer "mobile"
      t.string "industry"
      t.string "county"
      t.string "leadsource"
      t.string "converted"
      t.timestamps 
    end
  end

  def down
    drop_table :leads
  end
end
