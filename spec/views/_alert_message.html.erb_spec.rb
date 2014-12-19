require 'spec_helper'

RSpec.describe 'ddr/alerts/message/_alert_message.html.erb', type: :view do

  before { allow(view).to receive(:alert_messages).and_return([ "AAA", "BBB" ]) }
  it "displays the messages" do
    render partial: 'ddr/alerts/message/alert_message.html.erb'
    expect(rendered).to match(/AAA/)
    expect(rendered).to match(/BBB/)
  end

end