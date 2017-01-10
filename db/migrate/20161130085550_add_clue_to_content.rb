class AddClueToContent < ActiveRecord::Migration
  def change
    add_column :contents, :clue, :string
  end
end
