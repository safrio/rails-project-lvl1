# frozen_string_literal: true

module HexletCode
  class ElementWithLabel < Element
    def render
      [label_tag, main_tag].join Config::LINE_SPLITTER
    end

    private

    def label_tag
      Tag.build('label', { for: attrs[:name] }) { attrs[:name].capitalize }
    end

    def main_tag
      value ? Tag.build(tag_name, attrs) { value } : Tag.build(tag_name, attrs)
    end

    def tag_name
      Object.const_get(tag_const)
    end

    def tag_const
      [self.class.to_s, 'TAG'].join '::'
    end
  end
end
