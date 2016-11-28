class AddCatToUserBase < ActiveRecord::Migration[5.0]
  def change
    add_column :user_bases, :cat, :string
  end
end
