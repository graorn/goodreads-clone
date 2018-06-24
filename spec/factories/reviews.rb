# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  reviewer      :string
#  reviewed_book :string
#  text          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :review do
    reviewer 'MyString'
    text 'MyText'
  end
end
