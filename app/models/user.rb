class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ROLES = %w[patient medecin laborantin radiologue admin].freeze

  ROLES.each do |r|
    define_method "#{r}?" do
      role == r
    end
  end

  has_many :medical_records
end
