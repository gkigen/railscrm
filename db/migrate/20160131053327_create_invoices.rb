class CreateInvoices < ActiveRecord::Migration
  def up
    create_table :invoices do |t|
      t.string "name"
      t.string "description"
      t.integer "invoiceno"
      t.integer "ammount"   
      t.timestamps 
    end
  end

  def down
    drop_table :invoices
  end  
end
