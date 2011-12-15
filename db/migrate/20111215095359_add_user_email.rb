class AddUserEmail < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string   :email
    end
  end

  def down
    change_table :users do |t|
      t.remove   :email
    end
  end
end
