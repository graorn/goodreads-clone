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

class Review < ApplicationRecord
end
