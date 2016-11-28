class CreateUserBases < ActiveRecord::Migration[5.0]
  def change
    create_table :user_bases do |t|
      t.string :lname
      t.string :fname
      t.float :salary
      t.integer :home

      t.timestamps
    end
  end
end
