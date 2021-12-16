# frozen_string_literal: true

require_relative 'error'

module HexletCode
  class Tag
    SINGLE_TAGS = %i[br hr img input].freeze

    class << self
      def build(tag, *options, &block)
        raise HexletCodeError, "Tag param is not a string: #{tag}" unless tag.instance_of?(String)
        raise HexletCodeError, 'Tag param is empty' if tag.to_s.strip.empty?

        is_single = SINGLE_TAGS.include? tag.to_sym
        raise HexletCodeError, 'Can\'t generate single tag with block' if is_single && block_given?

        return single_tag(tag, options) if is_single

        paired_tags(tag, options, block)
      end

      def single_tag(tag, options) = format_single_tag(tag, render_options(options))

      def paired_tags(tag, options, block) = format_paired_tags(tag, render_options(options), block&.call)

      def render_options(options) = options.map { |option| option.map { |key, value| %( #{key}="#{value}") } }.join

      def format_single_tag(tag, options) = "<#{tag}#{options}>"

      def format_paired_tags(tag, options, block, splitter = '')
        "<#{tag}#{options}>#{splitter}#{block}#{block =~ /#{splitter}/ ? splitter : ''}</#{tag}>"
      end
    end
  end
end
