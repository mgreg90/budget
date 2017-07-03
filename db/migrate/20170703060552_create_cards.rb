class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
