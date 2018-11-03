class CreateDues < ActiveRecord::Migration[5.2]
  def change
    create_table :dues do |t|
      t.references :work, foreign_key: true
      t.date :dueDate

      t.timestamps
    end
  end
end
