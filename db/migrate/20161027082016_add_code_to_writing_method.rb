class AddCodeToWritingMethod < ActiveRecord::Migration
  def change
    add_column :writing_methods, :code, :integer
  end
end
