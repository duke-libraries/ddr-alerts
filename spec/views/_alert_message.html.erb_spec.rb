require 'spec_helper'

RSpec.describe 'ddr/alerts/message/_alert_message.html.erb', type: :view do

  let(:msgs) { [ FactoryGirl.create(:message, message: "AAA"), FactoryGirl.create(:message, message: "BBB") ] }
  it "displays the messages" do
    render partial: 'ddr/alerts/message/alert_message.html.erb', locals: { alert_messages: msgs }
    expect(rendered).to match(/AAA/)
    expect(rendered).to match(/BBB/)
  end

end