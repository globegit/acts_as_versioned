class CreateVersionedDocument < ActiveRecord::Migration
  def up
    Document.create_versioned_table
  end

  def down
    Document.drop_versioned_table
  end
end
