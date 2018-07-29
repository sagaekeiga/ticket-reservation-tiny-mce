class CreateUsersProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :users_profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :gender
      t.timestamps
    end
  end
end
