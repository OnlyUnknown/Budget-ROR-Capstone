# spec/views/groups/show.html.erb_spec.rb
require 'rails_helper'
require 'devise'
RSpec.describe 'groups/show', type: :view do
  user = User.create(name: 'Tom', email: 'eamil@gmail.com', password: '123123')
  group = Group.create(user_id: user, name: 'name', icon: 'mac')
  linked = Entity.create(id: 1, name: 'name', amount: 10)
  category = Category.create(group_id: group, entity_id: linked)
  before do
    sign_in(user)
    assign(:group, group)
    assign(:category, category)
    assign(:notice, 'Test notice message') # Assuming you want to test a notice message
    render
  end

  it 'displays the header and back link' do
    expect(rendered).to have_css('.headerc')
    expect(rendered).to have_css('.backa')
  end

  it 'displays the "TRANSACTIONS" header' do
    expect(rendered).to have_css('h2.header', text: 'TRANSACTIONS')
  end

  it 'renders Groups and their details' do
    render
    expect(rendered).to have_content(group.name)
  end

  it 'displays the "Add Transaction" button' do
    expect(rendered).to have_link('Add Transaction', href: new_entity_path)
    expect(rendered).to have_css('.categoryab', text: 'Add Transaction')
  end
end
