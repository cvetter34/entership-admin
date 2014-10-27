# This migration comes from entership_shared_engine (originally 20140831150327)
class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts, id: :uuid do |t|
      t.string   :subject,        null: false,  index: true
      t.text     :body,           null: false
      t.boolean  :has_been_seen,                index: true,  default: false
      t.uuid     :member_id,                    index: true
      t.uuid     :company_id,                   index: true

      t.timestamps
    end
  end
end
