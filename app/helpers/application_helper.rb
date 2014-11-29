module ApplicationHelper
  def money_field(form, resource, field_name, class_value)
    value = resource.send(field_name)

    if value > 0
      form.text_field(field_name,
                      class: class_value,
                      value: money_without_cents(value)
                     )
    else
      form.text_field(field_name, class: class_value, value: '', placeholder: '0')
    end
  end
end
