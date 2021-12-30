# frozen_string_literal: true

module HexletCode
  autoload :Config, 'hexlet_code/config'
  autoload :Element, 'hexlet_code/elements/element'
  autoload :ElementWithLabel, 'hexlet_code/elements/element_with_label'
  autoload :Input, 'hexlet_code/elements/input'
  autoload :Textarea, 'hexlet_code/elements/textarea'
  autoload :Submit, 'hexlet_code/elements/submit'

  class Form
    attr_accessor :elements, :form_attrs, :data

    def initialize(form_attrs:, data:)
      @form_attrs = form_attrs
      @data = data
      @elements = []
    end

    def input(name, attrs = {})
      elements << Object.const_get(input_class(attrs)).new(name: name, value: data[name], attrs: attrs)
    end

    def submit(value = nil, attrs = {})
      elements << Submit.new(value: value, attrs: attrs)
    end

    def render
      Tag.build('form', form_attrs) { elements.map(&:render).join Config::LINE_SPLITTER }
    end

    private

    def input_class(attrs)
      case attrs[:as]&.to_sym
      when :text
        'HexletCode::Textarea'
      else
        'HexletCode::Input'
      end
    end
  end
end
