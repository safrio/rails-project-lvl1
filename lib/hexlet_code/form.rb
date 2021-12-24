# frozen_string_literal: true

require_relative './config'
require_relative './elements/element'
require_relative './elements/text'
require_relative './elements/textarea'
require_relative './elements/submit'

module HexletCode
  class Form
    attr_accessor :elements, :form_attrs, :data

    def initialize(form_attrs:, data:)
      @form_attrs = form_attrs
      @data = data
      @elements = []
    end

    def input(name, attrs = {})
      elements << if textarea?(attrs)
                    Textarea.new(name: name, value: data[name], attrs: attrs)
                  else
                    Text.new(name: name, value: data.send(name), attrs: attrs)
                  end
    end

    def submit(value = nil, attrs = {}) = elements << Submit.new(value: value, attrs: attrs)

    def render = Tag.build('form', form_attrs) { elements.map(&:render).join Config::LINE_SPLITTER }

    private

    def textarea?(attrs) = attrs[:as]&.to_sym == :text
  end
end
