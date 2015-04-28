class AddSessionCodeToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :session_code, :string
  end
end
