class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers, id: :uuid do |t|
      t.string    :name,                      null: false,  index: true
      t.string    :email,                     null: false,  index: true
      t.string    :salt,                      null: false
      t.string    :fish,                      null: false
      t.string    :password_reset_code,                     index: true
      t.timestamp :password_reset_expires_at,               index: true
      t.boolean   :is_director,                             index: true,  default: false

      t.timestamps
    end

    add_index :managers, :name,                unique: true
    add_index :managers, :email,               unique: true
    add_index :managers, :password_reset_code, unique: true
  end
end
