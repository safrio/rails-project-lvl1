# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %i[br hr img input].freeze

    class << self
      def build(tag, attrs = {}, &block)
        raise HexletCodeError, "Tag param is not a string: #{tag}" unless tag.instance_of?(String)
        raise HexletCodeError, 'Tag param is empty' if tag.to_s.strip.empty?

        is_single = SINGLE_TAGS.include? tag.to_sym
        raise HexletCodeError, 'Can\'t generate single tag with block' if is_single && block_given?

        attrs = render_attrs(attrs)

        return single_tag(tag, attrs) if is_single

        paired_tags(tag, attrs, block)
      end

      private

      def render_attrs(attrs)
        attrs.sort.map { |key, value| %( #{key}="#{value}") }.join
      end

      def single_tag(tag, attrs)
        "<#{tag}#{attrs} />"
      end

      def paired_tags(tag, attrs, block)
        payload = block&.call
        splitter = !payload.nil? && payload.length > Config::MAX_INLINE_BLOCK_LENGTH ? Config::LINE_SPLITTER : ''
        "<#{tag}#{attrs}>#{splitter}#{payload}#{splitter}</#{tag}>"
      end
    end
  end
end
