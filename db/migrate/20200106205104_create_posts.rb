class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, :required => true
      t.string :content, :required => true
      t.integer :user_id, :required => true
    end
  end
end
