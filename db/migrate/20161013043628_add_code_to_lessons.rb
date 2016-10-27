class AddCodeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :code, :integer
  end
end
