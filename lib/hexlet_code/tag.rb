# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %i[br hr img].freeze

    class << self
      def build(tag, *options, &block)
        raise ArgumentError, 'Tag param is not a string' unless tag.instance_of?(String)
        raise ArgumentError, 'Tag param is empty' if tag.to_s.strip.empty?

        is_single = SINGLE_TAGS.include? tag.to_sym
        raise ArgumentError, 'Can\'t generate single tag with block' if is_single && !block.nil? # block_given?

        p "tag: #{tag}"
        p "options: #{options}"
        p "block: #{block&.call}"
      end
    end
  end
end
