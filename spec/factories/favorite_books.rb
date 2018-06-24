FactoryBot.define do
  factory :favorite_book do
    user nil
    book_belongs_to "MyString"
    favorite false
  end
end
