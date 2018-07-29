class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # -------------------------------------------------------------------------------
  # Relations
  # -------------------------------------------------------------------------------
  has_many :deliveries, dependent: :destroy
  has_one :profile, class_name: 'Users::Profile', dependent: :destroy
  accepts_nested_attributes_for :profile
end
