class AddSortToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :sort, :integer
  end
end
