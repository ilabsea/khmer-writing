class ChangeColumnNameInContents < ActiveRecord::Migration
  def change
    rename_column :contents, :clue, :image_clue
  end
end
