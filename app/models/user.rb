class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  has_many :works ,dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy

  attachment :image

end
