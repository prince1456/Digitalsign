class AddImageToTemplates < ActiveRecord::Migration[5.0]
  def change
    add_column :templates, :image, :string
  end
end
