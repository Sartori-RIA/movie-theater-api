# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  acts_as_paranoid

  devise :database_authenticatable,
         :encryptable,
         :registerable,
         :recoverable,
         :confirmable,
         :validatable,
         :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  attr_accessor :login

  validates :email, :cell_phone, :first_name, :last_name, presence: true

  belongs_to :role

  def login
    @login || cell_phone || email
  end

  # noinspection RubyClassMethodNamingConvention
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).find_by(
          ['lower(cell_phone) = :value OR lower(email) = :value', {value: login.downcase}]
      )
    elsif conditions.key?(:cell_phone) || conditions.key?(:email)
      find_by(conditions.to_h)
    end
  end

  def email_required?
    email.nil? && cell_phone.nil?
  end

  def on_jwt_dispatch(token, payload)
    super
  end

  def password_salt
    'no salt'
  end

  def password_salt=(new_salt) end

  def send_reset_password_instructions; end
end
