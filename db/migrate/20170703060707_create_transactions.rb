class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :card, foreign_key: true
      t.integer :price_in_cents
      t.string :item_name
      t.string :vendor

      t.timestamps
    end
  end
end
