class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :content
      t.string :string
      t.references :writing_method, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
