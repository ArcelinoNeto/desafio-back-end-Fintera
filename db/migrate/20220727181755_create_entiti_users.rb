class CreateEntitiUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :entiti_users do |t|
      t.references :entiti, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
