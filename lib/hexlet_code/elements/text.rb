# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper

require_relative './element'

class Text < Element
  REQUIRED_ATTRS = { type: 'text' }.freeze

  def initialize(name:, value:, attrs:)
    @attrs = attrs.merge(name: name, value: value).merge(REQUIRED_ATTRS)
  end
end

# rubocop:enable Lint/MissingSuper
