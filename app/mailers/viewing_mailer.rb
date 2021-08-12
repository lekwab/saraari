class ViewingMailer < ApplicationMailer

    def viewing agent_id, first_name, last_name, email, phone
        @agent = Account.find(agent_id)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @phone = phone

        if @agent.present?
            mail to: @agent.email, message: "You have a new viewing appointment from saraari"