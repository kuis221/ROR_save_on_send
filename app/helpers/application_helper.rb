module ApplicationHelper
  def money_field(form, resource, field_name)
    value = resource.send(field_name)
    
    if value > 0
      form.text_field(field_name, 
                      class: 'form-control', 
                      value: money_without_cents(value)
                     )
    else
      form.text_field(field_name, class: 'form-control', value: '', placeholder: '0')
    end
  end
end
