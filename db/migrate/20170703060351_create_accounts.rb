class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string      :name
      t.references  :user, foreign_key: true
      t.boolean     :primary, default: false
      t.integer     :initial_balance_in_cents, default: 0
      t.datetime    :initial_balance_time

      t.timestamps
    end
  end
end
