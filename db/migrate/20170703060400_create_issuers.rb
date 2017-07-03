class CreateIssuers < ActiveRecord::Migration[5.0]
  def change
    create_table :issuers do |t|
      t.string :name

      t.timestamps
    end
    
    add_reference :accounts, :issuer, foreign_key: true
  end
end
