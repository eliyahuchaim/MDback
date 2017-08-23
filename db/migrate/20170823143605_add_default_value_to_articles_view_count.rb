class AddDefaultValueToArticlesViewCount < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :view_count, :integer, default: 0
  end
end
