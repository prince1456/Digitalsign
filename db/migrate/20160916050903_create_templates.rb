class CreateTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :templates do |t|
      t.string :temp_name
      t.text :temp_body

      t.timestamps
    end
  end
end
