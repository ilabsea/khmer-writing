class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :string
      t.references :grade, index: true

      t.timestamps
    end
  end
end
