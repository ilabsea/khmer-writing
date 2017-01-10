class AddAudioToContents < ActiveRecord::Migration
  def change
    add_column :contents, :audio, :string
  end
end
