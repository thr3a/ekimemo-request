class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.string :id
      t.string :name
      t.integer :state
      t.integer :favor_num

      t.timestamps null: false
    end
  end
end
