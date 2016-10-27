class CreateWritingMethods < ActiveRecord::Migration
  def change
    create_table :writing_methods do |t|
      t.string :name
      t.string :string
      t.string :icon
      t.string :string

      t.timestamps
    end
  end
end
