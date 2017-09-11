class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
