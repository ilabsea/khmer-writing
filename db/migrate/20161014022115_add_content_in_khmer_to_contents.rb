class AddContentInKhmerToContents < ActiveRecord::Migration
  def change
    add_column :contents, :content_in_khmer, :string
  end
end
