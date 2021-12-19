# frozen_string_literal: true

require_relative 'error'

module HexletCode
  class Tag
    class << self
      def build(tag, options = {}, &block)
        raise HexletCodeError, "Tag param is not a string: #{tag}" unless tag.instance_of?(String)
        raise HexletCodeError, 'Tag param is empty' if tag.to_s.strip.empty?

        Haml::Engine.new("%#{tag}#{options}> #{block&.call}").render
      end
    end
  end
end
