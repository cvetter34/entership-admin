# This migration comes from entership_shared_engine (originally 20140831142751)
class EnableUuidOsspExtension < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
  end
end
