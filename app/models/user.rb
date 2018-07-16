# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  provider               :string
#  uid                    :string
#  name                   :string
#  image                  :string
#

class User < ApplicationRecord
  before_save :normalize_email
  acts_as_favoritor


  # Associations

  has_many :reviews, as: :reviewable
  has_many :reviewers, as: :reviewer

  has_many :reads
  has_many :books, through: :reads

  has_one_attached :avatar

  # Validations

  validates :password, presence: true
  validates :email, uniqueness: {message: 'Duplicate email'}, presence: true


  # Devise

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, omniauth_providers: %i[facebook]


  #Omniauth

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private
    def normalize_email
      self.email = self.email.downcase.strip
    end
end
