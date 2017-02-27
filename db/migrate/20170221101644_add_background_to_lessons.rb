class AddBackgroundToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :background, :string
  end
end
