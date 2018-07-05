# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  reviewable_type :string
#  reviewable_id   :integer
#  reviewer_type   :string
#  reviewer_id     :integer
#  rating          :integer
#  body            :text
#  title           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, polymorphic: true
end
