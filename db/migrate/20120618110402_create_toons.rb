class CreateToons < ActiveRecord::Migration
  def change
    create_table :toons do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.text :why_fav
      t.timestamps
    end
  end
end
