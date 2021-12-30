# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper

module HexletCode
  class Textarea < ElementWithLabel
    DEFAULT_ATTRS = { cols: 20, rows: 40 }.freeze
    EXTRA_ATTRS = [:as].freeze

    def initialize(name:, value:, attrs:)
      @value = value
      @attrs = DEFAULT_ATTRS.merge(attrs).reject { |attr| EXTRA_ATTRS.include? attr }.merge(name: name)
    end
  end
end

# rubocop:enable Lint/MissingSuper
