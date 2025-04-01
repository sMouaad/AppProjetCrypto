require "application_system_test_case"

class MedicalRecordsTest < ApplicationSystemTestCase
  setup do
    @medical_record = medical_records(:one)
  end

  test "visiting the index" do
    visit medical_records_url
    assert_selector "h1", text: "Medical records"
  end

  test "should create medical record" do
    visit medical_records_url
    click_on "New medical record"

    fill_in "Abe attributes", with: @medical_record.abe_attributes
    fill_in "Content", with: @medical_record.content
    fill_in "Title", with: @medical_record.title
    fill_in "User", with: @medical_record.user_id
    click_on "Create Medical record"

    assert_text "Medical record was successfully created"
    click_on "Back"
  end

  test "should update Medical record" do
    visit medical_record_url(@medical_record)
    click_on "Edit this medical record", match: :first

    fill_in "Abe attributes", with: @medical_record.abe_attributes
    fill_in "Content", with: @medical_record.content
    fill_in "Title", with: @medical_record.title
    fill_in "User", with: @medical_record.user_id
    click_on "Update Medical record"

    assert_text "Medical record was successfully updated"
    click_on "Back"
  end

  test "should destroy Medical record" do
    visit medical_record_url(@medical_record)
    accept_confirm { click_on "Destroy this medical record", match: :first }

    assert_text "Medical record was successfully destroyed"
  end
end
