class CreateEntitis < ActiveRecord::Migration[6.1]
  def change
    create_table :entitis do |t|
      t.string :name
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
