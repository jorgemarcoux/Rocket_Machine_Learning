class Intervention < ApplicationRecord
  belongs_to :customer
  belongs_to :building
  belongs_to :battery, optional: true
  belongs_to :column, optional: true
  belongs_to :elevator, optional: true
  belongs_to :employee, optional: true
  
  after_create :new_intervention_ticket

  def new_intervention_ticket
    client = ZendeskAPI::Client.new do |config|
      config.url = 'https://apageau.zendesk.com/api/v2'
      config.username = ENV['ZENDESK_EMAIL']
      config.token = ENV['ZENDESK_TOKEN']
    end

    ZendeskAPI::Ticket.create!(client,
    :subject => "New intervention request for #{self.customer.company_name}",
    :comment => { 
      :value => "Important informations about the request.\n\n
                Customer: #{self.customer.company_name}\n
                Building Id: #{self.building_id}\n
                Battery Id: #{self.battery_id}\n
                Column Id: #{self.column_id}\n
                Elevator Id: #{self.elevator_id}\n
                Employee: #{self.employee.first_name} #{self.employee.last_name}\n
                Description: #{self.report}"
    },
    :requester => {
      "name": "#{employee.first_name} #{employee.last_name}",
      "email": employee.email
    },
    :priority => "normal",
    :type => "Question"
    )
  end
end
