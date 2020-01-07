class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, :required => true
      t.string :email, :required => true
      t.string :password, :required => true
    end
  end
end
