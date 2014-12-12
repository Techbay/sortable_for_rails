class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :index
      t.integer :sortable_id
      t.string :content

      t.timestamps
    end
  end
end
