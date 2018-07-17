# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Users", type: :feature do
  let!(:user) { create :user }

  before(:each) do
    visit new_user_session_path
  end

  describe "Login" do
    context "do not submit" do
      scenario "anything" do
        click_button "Log in"

        expect(page).to have_content "Invalid Email or password."
      end

      scenario "email" do
        fill_in "user_password", with: user.password

        click_button "Log in"

        expect(page).to have_content "Invalid Email or password."
      end

      scenario "password" do
        fill_in "user_email", with: user.email

        click_button "Log in"

        expect(page).to have_content "Invalid Email or password."
      end

      context "correct" do
        scenario "email" do
          fill_in "user_email", with: "wrongEmail@mail.com"
          fill_in "user_password", with: user.password

          click_button "Log in"

          expect(page).to have_content "Invalid Email or password."
        end

        scenario "password" do
          fill_in "user_email", with: user.email
          fill_in "user_password", with: "wrong password"

          click_button "Log in"

          expect(page).to have_content "Invalid Email or password."
        end
      end
    end


    scenario "submit valid data" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password

      click_button "Log in"

      expect(page).to have_content "Signed in successfully."
    end

    scenario "Logout" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password

      click_button "Log in"
      click_link "Sign out"

      expect(page).to have_content "Signed out successfully."
    end
  end
end
