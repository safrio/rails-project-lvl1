# frozen_string_literal: true

require_relative 'error'

module HexletCode
  class Tag
    class << self
      def build(tag, attrs = {}, &block)
        raise HexletCodeError, "Tag param is not a string: #{tag}" unless tag.instance_of?(String)
        raise HexletCodeError, 'Tag param is empty' if tag.to_s.strip.empty?

        is_single = Config::SINGLE_TAGS.include? tag.to_sym
        raise HexletCodeError, 'Can\'t generate single tag with block' if is_single && block_given?

        attrs = render_attrs(attrs)

        return single_tag(tag, attrs) if is_single

        paired_tags(tag, attrs, block)
      end

      def single_tag(tag, attrs) = format_single_tag(tag, attrs)

      def paired_tags(tag, attrs, block) = format_paired_tags(tag, attrs, block&.call)

      def render_attrs(attrs) = attrs.sort.map { |key, value| %( #{key}="#{value}") }.join

      def format_single_tag(tag, attrs) = "<#{tag}#{attrs} />"

      def format_paired_tags(tag, attrs, block)
        splitter = !block.nil? && block.length > Config::MAX_INLINE_BLOCK_LENGTH ? Config::LINE_SPLITTER : ''
        "<#{tag}#{attrs}>#{splitter}#{block}#{splitter}</#{tag}>"
      end
    end
  end
end
