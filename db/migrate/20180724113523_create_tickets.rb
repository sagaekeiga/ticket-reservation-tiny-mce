class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title        # チケット名
      t.text :body           # チケットの内容
      t.integer :number      # チケット販売可能個数
      t.datetime :expired_at # チケットの予約締切日時
      t.timestamps
    end
  end
end
