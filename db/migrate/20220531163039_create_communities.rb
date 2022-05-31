class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.references :account
      t.string :name
      t.string :url
      t.text :rules
      t.integer :total_numbers
      t.timestamps
    end
  end
end
