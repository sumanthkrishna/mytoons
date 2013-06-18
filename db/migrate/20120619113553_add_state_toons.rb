class AddStateToons < ActiveRecord::Migration
  def up
     add_column :toons, :state , :string , :default => "inactive"
  end

  def down
  end
end
