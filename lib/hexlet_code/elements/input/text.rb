# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper

module HexletCode
  class Text < ElementWithLabel
    TAG = 'textarea'
    DEFAULT_ATTRS = { cols: 20, rows: 40 }.freeze

    def initialize(name:, value:, attrs:)
      @value = value
      @attrs = DEFAULT_ATTRS.merge(attrs).merge(name: name)
    end
  end
end

# rubocop:enable Lint/MissingSuper
