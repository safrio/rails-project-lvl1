# frozen_string_literal: true

module HexletCode
  autoload :Config, 'hexlet_code/config'
  autoload :Element, 'hexlet_code/elements/element'
  autoload :ElementWithLabel, 'hexlet_code/elements/element_with_label'
  autoload :Submit, 'hexlet_code/elements/submit'
  autoload :Input, 'hexlet_code/elements/input'

  class Form
    attr_accessor :elements, :form_attrs, :data

    def initialize(form_attrs:, data:)
      @form_attrs = form_attrs
      @data = data
      @elements = []
    end

    def input(name, attrs = {})
      elements << Input.new(name: name, value: data.send(name), attrs: attrs)
    end

    def submit(value = nil, attrs = {})
      elements << Submit.new(value: value, attrs: attrs)
    end

    def render
      Tag.build('form', form_attrs) { elements.map(&:render).join Config::LINE_SPLITTER }
    end
  end
end
