class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :article_id
      t.string :user_id
      t.string :provider

      t.timestamps
    end
  end
end
