class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true

  def password_required?
    new_record? ? false : super
  end
end
