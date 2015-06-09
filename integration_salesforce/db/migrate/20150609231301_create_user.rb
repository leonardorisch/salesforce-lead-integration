class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, null: false
    	t.string :lastname, null: false
    	t.string :email, null: false
    	t.string :company, null: false
    	t.string :job_title, null: false
    	t.string :phone, null: false
    	t.string :website, null: false
    end
  end
end
