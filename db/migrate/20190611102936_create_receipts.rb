class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :date
      t.string :name
      t.string :publisher
      t.string :representative
      t.string :price
      t.string :provision

      t.timestamps
    end
  end
end
