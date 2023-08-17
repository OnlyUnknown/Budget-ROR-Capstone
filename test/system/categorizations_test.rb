require 'application_system_test_case'

class CategorizationsTest < ApplicationSystemTestCase
  setup do
    @categorization = categorizations(:one)
  end

  test 'visiting the index' do
    visit categorizations_url
    assert_selector 'h1', text: 'Categorizations'
  end

  test 'should create categorization' do
    visit categorizations_url
    click_on 'New categorization'

    fill_in 'Entity', with: @categorization.entity_id
    fill_in 'Group', with: @categorization.group_id
    click_on 'Create Categorization'

    assert_text 'Categorization was successfully created'
    click_on 'Back'
  end

  test 'should update Categorization' do
    visit categorization_url(@categorization)
    click_on 'Edit this categorization', match: :first

    fill_in 'Entity', with: @categorization.entity_id
    fill_in 'Group', with: @categorization.group_id
    click_on 'Update Categorization'

    assert_text 'Categorization was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Categorization' do
    visit categorization_url(@categorization)
    click_on 'Destroy this categorization', match: :first

    assert_text 'Categorization was successfully destroyed'
  end
end
