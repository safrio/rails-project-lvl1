# frozen_string_literal: true

module HexletCode
  autoload :Default, 'hexlet_code/elements/input/default'
  autoload :Text, 'hexlet_code/elements/input/text'

  class Input
    attr_accessor :name, :value, :attrs

    AS_ATTR = :as

    def initialize(name:, value:, attrs:)
      @name = name
      @value = value
      @attrs = attrs
    end

    def render
      [label_tag, main_tag].join Config::LINE_SPLITTER
    end

    private

    def label_tag
      Tag.build('label', { for: label_value }) { label_value.capitalize }
    end

    def main_tag
      attrs = @attrs.reject { |attr| AS_ATTR == attr }
      inner_class.new(name: name, value: value, attrs: attrs).render
    end

    def label_value
      attrs[:name] || name
    end

    def inner_class
      Object.const_get [module_name, class_name].join '::'
    end

    def module_name
      self.class.to_s.split('::').first
    end

    def class_name
      attrs.fetch(AS_ATTR, :default).capitalize
    end
  end
end
