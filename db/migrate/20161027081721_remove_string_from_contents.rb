class RemoveStringFromContents < ActiveRecord::Migration
  def change
    remove_column :contents, :string
  end
end
