class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :confirmable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def login
    @login || cell_phone || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(
          ['lower(cell_phone) = :value OR lower(email) = :value', {value: login.downcase}]
      ).first
    elsif conditions.key?(:cell_phone) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def email_required?
    if email.nil? && cell_phone.nil?
      true
    else
      false
    end
  end

  def password_salt=(new_salt) end

  def on_jwt_dispatch(token, payload)
    super
  end

  def send_reset_password_instructions; end

end
