class AdminFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options={})
    has_errors = @object.errors[method].any?

    @template.content_tag(:div, class: 'govuk-form-group' + (has_errors ? ' govuk-form-group--error' : '')) do
      @template.label(:label, method, class: 'govuk-label') +
      (has_errors ? @template.content_tag(:span, @object.errors.full_messages_for(method).join(''), class: 'govuk-error-message') : '') +
      super(method, options.merge({class: 'govuk-input' + (has_errors ? ' govuk-input--error' : '')}))
    end
  end

  def text_area(method, options={})
    has_errors = @object.errors[method].any?

    @template.content_tag(:div, class: 'govuk-form-group' + (has_errors ? ' govuk-form-group--error' : '')) do
      @template.label(:label, method, class: 'govuk-label') +
      (has_errors ? @template.content_tag(:span, @object.errors.full_messages_for(method).join(''), class: 'govuk-error-message') : '') +
      super(method, options.merge({class: 'govuk-textarea' + (has_errors ? ' govuk-textarea--error' : '')}))
    end
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    has_errors = @object.errors[method].any?

    @template.content_tag(:div, class: 'govuk-form-group' + (has_errors ? ' govuk-form-group--error' : '')) do
      @template.label(:label, method, class: 'govuk-label') +
      (has_errors ? @template.content_tag(:span, @object.errors.full_messages_for(method).join(''), class: 'govuk-error-message') : '') +
      super(method, choices, options, html_options.merge({class: 'govuk-select' + (has_errors ? ' govuk-select--error' : '')}), &block)
    end
  end

  def number_field(method, options = {})
    has_errors = @object.errors[method].any?

    @template.content_tag(:div, class: 'govuk-form-group' + (has_errors ? ' govuk-form-group--error' : '')) do
      @template.label(:label, method, class: 'govuk-label') +
      (has_errors ? @template.content_tag(:span, @object.errors.full_messages_for(method).join(''), class: 'govuk-error-message') : '') +
      super(method, options.merge({class: 'govuk-input' + (has_errors ? ' govuk-input--error' : '')}))
    end
  end
end
