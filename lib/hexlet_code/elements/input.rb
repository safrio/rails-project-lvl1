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

    def build
      attrs = @attrs.reject { |attr| [AS_ATTR].include? attr }
      value ? Tag.build(tag_name, attrs) { value } : Tag.build(tag_name, attrs)
    end

    private

    def label_tag
      Tag.build('label', { for: label_value }) { label_value.capitalize }
    end

    def main_tag
      inner_class.new(name: name, value: value, attrs: attrs).build
    end

    def tag_name
      Object.const_get(tag_const)
    end

    def label_value
      attrs[:name] || name
    end

    def inner_class
      Object.const_get [module_name, class_name].join '::'
    end

    def tag_const
      [self.class.to_s, 'TAG'].join '::'
    end

    def module_name
      self.class.to_s.split('::').first
    end

    def class_name
      attrs.fetch(AS_ATTR, :default).capitalize
    end
  end
end
