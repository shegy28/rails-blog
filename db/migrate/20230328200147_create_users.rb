class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: "https://img.freepik.com/free-icon/user_318-159711.jpg"
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end
