class AddFavorListToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :favor_list, :text
  end
end
