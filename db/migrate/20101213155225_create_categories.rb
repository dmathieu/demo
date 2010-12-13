class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      
      t.timestamps
    end
    
    change_table(:posts) do |t|
      t.integer :category_id
      
    end
  end

  def self.down
    drop_table :categories
    
    update_table(:posts) do |t|
      t.remove :category_id
    end
  end
end
