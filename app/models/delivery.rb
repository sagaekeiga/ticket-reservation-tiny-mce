class Delivery < ApplicationRecord
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  belongs_to :user
  belongs_to :ticket
  # -------------------------------------------------------------------------------
  # ClassMethods
  # -------------------------------------------------------------------------------
  #
  # 男女数を配列で返す
  #
  # @return  ex. [10, 20]
  #
  def self.genders
    genders = []
    users = User.where(id: pluck(:user_id))
    Users::Profile.genders.keys.each { |gender| genders << Users::Profile.where(user: users, gender: gender.to_sym).count }
    genders
  end
end
