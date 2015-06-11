class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :company, null: false
      t.string :jobtitle, null: false
      t.string :phone, null: false
      t.string :website, null: false

      t.timestamps null: false
    end
  end
end
