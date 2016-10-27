class AddKhmerNumbericToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :khmer_numeric, :string
  end
end
