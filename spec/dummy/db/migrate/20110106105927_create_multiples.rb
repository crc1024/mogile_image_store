class CreateMultiples < ActiveRecord::Migration
  def self.up
    create_table :multiples do |t|
      t.string :title
      t.integer :confirm_id
      t.string :banner1, limit: 36
      t.string :banner2, limit: 36

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :multiples
  end
end
