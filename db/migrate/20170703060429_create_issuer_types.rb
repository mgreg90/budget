class CreateIssuerTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :issuer_types do |t|
      t.string :name

      t.timestamps
    end
    
    add_reference :issuers, :issuer_type, foreign_key: true
  end
end
