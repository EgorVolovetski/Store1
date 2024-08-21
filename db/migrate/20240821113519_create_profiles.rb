class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :role

      t.timestamps
    end
  end
end
