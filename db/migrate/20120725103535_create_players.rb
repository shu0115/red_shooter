class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
