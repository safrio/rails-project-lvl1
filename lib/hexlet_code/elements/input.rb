# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper

module HexletCode
  class Input < ElementWithLabel
    REQUIRED_ATTRS = { type: 'text' }.freeze

    def initialize(name:, value:, attrs:)
      @attrs = attrs.merge(name: name, value: value).merge(REQUIRED_ATTRS)
    end
  end
end

# rubocop:enable Lint/MissingSuper