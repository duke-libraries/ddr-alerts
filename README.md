# Ddr::Alerts

Alerts for the Duke Digital Repository

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ddr-alerts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ddr-alerts

## Usage

#### Migrations

Install the ddr-alerts migrations:

    rake ddr_alerts:install:migrations

then
    rake db:migrate
    rake db:test:prepare

#### View Partial

Ddr-alerts contains a view partial (ddr/alerts/message/_alert_message.html.erb) that displays the alert messages.  This partial depends on
the local 'alert_messages' to contain an array of Ddr::Alert::Message which are to be displayed.  Render this partial in the desired
view / layout of your application, passing in the appropriate value for the 'alert_messages' local.  For example, override Blacklight's
shared/_flash_messages.html.erb as shown below to include all active alert messages in the 'repository' context above the application's
flash messages on each page:

```
<div class="row">
  <div class="col-md-12">
    <div id="main-flashes">
	  <%= render partial: '/ddr/alerts/message/alert_message', locals: { alert_messages: Ddr::Alerts::Message.active.repository } %>
      <%= yield %>
    </div>
  </div>
</div>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ddr-alerts/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
