# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :messages

  has_secure_password
end
