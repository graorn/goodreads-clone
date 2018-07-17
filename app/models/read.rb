# frozen_string_literal: true

# == Schema Information
#
# Table name: reads
#
#  id      :integer          not null, primary key
#  user_id :integer          not null
#  book_id :integer          not null
#

class Read < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
