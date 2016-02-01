class RenameCasesToComplaints < ActiveRecord::Migration
  def change
  	rename_table :cases, :complaints
  end
end
