Scenario: Enviar email com notas (Caso ele não tenha recebido nenhum)
Given that the teacher submit one student grade in the system
And I see that the student “email notifications” are enabled
And the student didn’t receive an email in the day
When  the teacher submit one student grade
Then an email notifying the student that a grade has been sent is sent
And the student no longer receive emails from the system in this day


Scenario: Enviar email com notas (Caso ele tenha recebido)
Given that the teacher submit one student grade in the system
And I see that the student “email notifications” are enabled
And the student had already received an email in that day
When  the teacher submit one student grade
Then an email notifying the student that a grade has been sent isn’t sent
And the student no longer receive emails from the system in this day


Scenario: Possível calcular a DRMG
Given that the teacher has submitted the grades of at least two students
And “Joãozinho”’s “email notifications” are enabled
When  an email is ready to be sent to “Joãozinho” containing “Joãozinho” grades
Then calculate “Joãozinho”’s DRMG
And in “Joãozinho”’s email, send the DRMG alongside the grades


Scenario: Impossível calcular a DRMG
Given that the teacher hasn’t submitted the grades of at least two students
And “Joãozinho”’s “email notifications” are enabled
When  an email is ready to be sent to “Joãozinho” containing “Joãozinho” grades
Then send “Joãozinho” email with the message “Não foi possível calcular a DRMG” alongside “Joãozinho”’s grades 


Scenario: Desativar as notificações de email
Given I am logged as student
And I am at the configuration page
And I see that the “email notifications” are enabled
When I select the “email notifications” 
Then a message saying that email notifications are disabled is shown
And the student no longer receive emails from the system


Scenario: Ativar as notificações de email
Given I am logged as student
And I am at the configuration page
And I see that the “email notifications” are disabled
When I select the “email notifications” 
Then a message saying that email notifications are enabled is shown
And the student can receive emails from the system
