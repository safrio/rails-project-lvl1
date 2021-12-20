# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper

require_relative './element'

class Submit < Element
  REQUIRED_ATTRS = { type: 'submit' }.freeze

  def initialize(value:, attrs:)
    default_attrs = { name: 'submit', value: value || 'Save' }

    @attrs = default_attrs.merge(attrs, REQUIRED_ATTRS)
  end
end

# rubocop:enable Lint/MissingSuper
