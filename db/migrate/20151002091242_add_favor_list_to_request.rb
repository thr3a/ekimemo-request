class AddFavorListToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :Favor_list, :text
  end
end
