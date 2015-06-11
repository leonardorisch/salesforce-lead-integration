class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :company
      t.string :jobtitle
      t.string :phone
      t.string :website

      t.timestamps null: false
    end
  end
end
