class CreateCases < ActiveRecord::Migration
  def up
    create_table :cases do |t|
      t.string "company"
      t.string "state"
      t.string "status"
      t.string "handledby"
      t.timestamps 
    end
  end

  def down
    drop_table :cases
  end
end
