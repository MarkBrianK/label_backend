class AddCategoryToCloths < ActiveRecord::Migration[7.0]
  def change
    add_reference :cloths, :category, null: false, foreign_key: true
  end
end
