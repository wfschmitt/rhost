module Rhost
  module ApplicationHelper

    def rhost_version
      "Rhost #{Rhost::VERSION}"
    end

    def form_errors_for(form, field, options = {})
      if errors = form.object.errors[field]
        content_tag :p, errors.to_sentence, {:style => "color:red"}.merge(options)
      end
    end

  end
end
