class CreateWebsites < ActiveRecord::Migration[7.2]
  def change
    create_table :websites do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
