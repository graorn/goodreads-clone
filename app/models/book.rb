# frozen_string_literal: true
# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string
#  author      :string
#  genre       :string
#  description :string
#  rating      :integer
#  review      :text
#  favorite    :boolean
#  to_read     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Book < ApplicationRecord
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :author
end

