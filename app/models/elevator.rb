require 'twilio-ruby'
require 'slack-notifier'

class Elevator < ApplicationRecord
  belongs_to :column
  has_many :interventions

  around_update :send_slack_notif
  after_update :twilio_txt

  def elevator
    return "Elevator ##{self.id}"
  end

  private

  def send_slack_notif
    status_changed = self.elevator_status_changed?

    if status_changed
      notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK']
      notifier.ping "The Elevator ##{self.id} with Serial Number #{self.serial_number} changed status from **#{self.elevator_status_was}** to **#{self.elevator_status}**"
    end
    yield
  end

  def twilio_txt
    if self.elevator_status == "Intervention"
      require("bundler")
      Bundler.require()

      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      to = '15817771245'
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      @client.messages.create(
        to: ENV['PHONE_NUMBER'],
        from: '+17407497629',
        body: "Hi this is a message from Rocket Elevators. Elevator ##{self.id} now has the status of #{self.elevator_status}"
      )
    end
  end
end
