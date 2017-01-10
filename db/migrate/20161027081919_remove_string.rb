class RemoveString < ActiveRecord::Migration
  def change
    remove_column :writing_methods, :string
    remove_column :lessons, :string
  end
end
