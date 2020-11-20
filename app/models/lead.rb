require "date"

class Lead < ApplicationRecord
    belongs_to :user, optional: true
    validates :full_name, presence: true, allow_blank: false
    validates :email, presence: true, allow_blank: false
    validates :phone, presence: true, allow_blank: false
    validates :business_name, presence: true, allow_blank: false
    validates :project_name, presence: true, allow_blank: false
    validates :department, presence: true, allow_blank: false
    validates :project_description, presence: true, allow_blank: false
    validates :message, presence: true, allow_blank: false
    
    mount_uploader :attachment, AttachmentUploader

    #after_create :new_lead_ticket
    #after_create :sendMail

    def new_lead_ticket
      client = ZendeskAPI::Client.new do |config|
        config.url = 'https://apageau.zendesk.com/api/v2'
        config.username = ENV['ZENDESK_EMAIL']
        config.token = ENV['ZENDESK_TOKEN']
      end

      ZendeskAPI::Ticket.create!(client,
      :subject => "#{self.full_name} from #{self.business_name}",
      :comment => {
        :value => "The contact #{self.full_name} from company #{self.business_name} can be reached at email  #{self.email} and at phone number #{self.phone}.\n#{self.department} has a project named #{self.project_name} which would require contribution from Rocket Elevators.\n#{self.project_description}\nAttached Message: #{self.message}"
      },
      :requester => {
        "name": self.full_name,
        "email": self.email
      },
      :priority => "normal",
      :type => "Question"
      )
    end
    
    def sendMail
      email = self.email
      full_name = self.full_name
      project_name = self.project_name
      phone = self.phone

      mail = SendGrid::Mail.new
      mail.from = SendGrid::Email.new(email: "antopageau@hotmail.com")

      personalization = SendGrid::Personalization.new
      personalization.add_to(SendGrid::Email.new(email: email))
      personalization.add_dynamic_template_data({
          "full_name" => full_name,
          "project_name" => project_name,
          "phone" => phone
      })

      mail.add_personalization(personalization)
      mail.template_id = 'd-a3d530680fff48d0a0209903db23ebcb'

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      
      response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
