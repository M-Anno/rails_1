class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :avatar
      t.text :introduction

      t.timestamps
    end
  end
end
