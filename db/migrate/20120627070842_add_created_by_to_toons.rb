class AddCreatedByToToons < ActiveRecord::Migration
  def change
    add_column :toons, :created_by, :integer

  end
end
