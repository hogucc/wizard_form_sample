class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana

      t.timestamps
    end
  end
end
