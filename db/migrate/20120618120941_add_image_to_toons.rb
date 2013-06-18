class AddImageToToons < ActiveRecord::Migration
  def change
    add_column :toons, :image, :string

  end
end
