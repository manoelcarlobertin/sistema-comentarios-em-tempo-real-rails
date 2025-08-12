class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    subscriber: 'subscriber',
    admin: 'admin',
    super_admin: 'super_admin'
  }
end
