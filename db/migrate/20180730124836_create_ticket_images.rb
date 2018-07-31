class CreateTicketImages < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_images do |t|
      t.belongs_to :ticket, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end
