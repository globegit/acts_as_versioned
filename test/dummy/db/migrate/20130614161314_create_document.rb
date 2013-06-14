class CreateDocument < ActiveRecord::Migration
  def up
    create_table(:documents) do |t|
      t.column :name, :text
      t.column :body, :text
      t.timestamps
    end
  end
  def down
    drop_table(:documents) 
  end
end
