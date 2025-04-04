class AddManagerToWebsites < ActiveRecord::Migration[7.0]
  def change
    add_reference :websites, :manager, foreign_key: true, null: true
  end
end
