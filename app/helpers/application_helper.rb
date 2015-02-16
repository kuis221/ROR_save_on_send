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

  def display_service_quality_for_feedback(feedback)
    display_rating(feedback.service_quality, "#{feedback.class.model_name}_#{feedback.id}") 
  end

  def display_average_rating_for_remittance_term(remittance_term)
    display_rating(remittance_term.service_provider.average_rating, 
                   "#{remittance_term.class.model_name}_#{remittance_term.id}")
  end

  def display_average_rating_for_provider(provider)
    display_rating(provider.average_rating, "#{provider.class.model_name}_#{provider.id}")
  end

  def link_to_with_active(label, url, options = {})
    url_withour_anchor = url.gsub(/#.*$/, '')
    if current_page?(url_withour_anchor)
      if options[:class]
        options[:class] += (options[:class].is_a?(Array) ? ['active'] : ' active')
      else
        options[:class] = 'active'
      end
    end
  
    link_to(label, url, options)
  end

  private
  def display_rating(rate, control_id)
    display_rating_html = ''
    
    unless rate.nil?
      input_attrs = {class: :star, type: :radio, name: "star#{control_id}", disabled: 'disabled'}
      (1..5).each do |star|
        if star <= rate
          display_rating_html += tag(:input, input_attrs.merge(checked: 'checked'))
        else
          display_rating_html += tag(:input, input_attrs)
        end
      end
    end

    display_rating_html.html_safe
  end
end
