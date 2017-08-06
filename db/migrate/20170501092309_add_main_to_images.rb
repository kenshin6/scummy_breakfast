class AddMainToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :main, :boolean
  end
end
