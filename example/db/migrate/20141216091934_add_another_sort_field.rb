class AddAnotherSortField < ActiveRecord::Migration
  def change
    add_column :lists, :ordered_by, :integer
  end
end
