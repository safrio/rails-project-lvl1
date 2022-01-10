# frozen_string_literal: true

module HexletCode
  class Submit
    attr_accessor :attrs

    REQUIRED_ATTRS = { type: 'submit' }.freeze

    def initialize(value:, attrs:)
      default_attrs = { name: 'submit', value: value || 'Save' }

      @attrs = default_attrs.merge(attrs, REQUIRED_ATTRS)
    end

    def render
      Tag.build('input', attrs)
    end
  end
end
