class AddFieldsToContents < ActiveRecord::Migration
  def change
    add_column :contents, :image_answer, :string
  end
end
