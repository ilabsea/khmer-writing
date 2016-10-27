class AddCodeToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :code, :integer
  end
end
