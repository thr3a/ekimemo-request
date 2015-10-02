class AddisAnonyToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :is_anony, :boolean
  end
end
