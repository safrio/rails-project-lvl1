# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper

module HexletCode
  autoload :Default, 'hexlet_code/elements/input/default'
  autoload :Text, 'hexlet_code/elements/input/text'

  class Input < Element
    AS_ATTR = :as

    def initialize(name:, value:, attrs:)
      @name = name
      @value = value
      @attrs = attrs.reject { |attr| [AS_ATTR].include? attr }
      @klass = Object.const_get [module_name, attrs.fetch(AS_ATTR, :default).capitalize].join '::'
    end

    def render
      @klass.new(name: name, value: value, attrs: attrs).render
    end

    private

    def module_name
      self.class.to_s.split('::').first
    end
  end
end

# rubocop:enable Lint/MissingSuper
