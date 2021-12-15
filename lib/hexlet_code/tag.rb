# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %i[br hr img input].freeze

    class << self
      def build(tag, *options, &block)
        raise 'Tag param is not a string' unless tag.instance_of?(String)
        raise 'Tag param is empty' if tag.to_s.strip.empty?

        is_single = SINGLE_TAGS.include? tag.to_sym
        raise 'Can\'t generate single tag with block' if is_single && block_given?

        return single_tag(tag, options) if is_single

        paired_tags(tag, options, block)
      end

      def single_tag(tag, options) = format_single_tag(tag, render_options(options))

      def paired_tags(tag, options, block) = format_paired_tags(tag, render_options(options), block&.call)

      def render_options(options) = options.map { |option| option.map { |key, value| %Q[ #{key}="#{value}"] } }.join

      def format_single_tag(tag, options) = "<#{tag}#{options}>"

      def format_paired_tags(tag, options, block, splitter = '') = "<#{tag}#{options}>#{splitter}#{block}</#{tag}>"
    end
  end
end
