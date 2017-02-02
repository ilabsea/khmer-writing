class RemoveCodeFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :code
  end
end
