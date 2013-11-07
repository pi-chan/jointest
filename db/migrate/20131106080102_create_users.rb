class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.timestamps
    end

    create_table :entries do |t|
      t.string :title, default:""
      t.text :content
      t.datetime :published_at, null:false
      t.timestamps
    end
    add_index :entries, :published_at

    create_table :relationships do |t|
      t.integer :user_id, null:false
      t.integer :entry_id, null:false
      t.boolean :starred, default: false
    end
    add_index :relationships, :user_id
    add_index :relationships, :entry_id
    add_index :relationships, [:user_id,:entry_id], unique:true

  end
end
