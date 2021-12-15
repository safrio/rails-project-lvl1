# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

module HexletCode
  class << self
    ACTIONS_OPTION = :url
    DEFAULT_ACTION = '#'

    def form_for(obj, options = {}, &block)
      raise 'Object param is not a Struct' unless obj.class.ancestors.include? Struct

      options = %Q[ action="#{action(options)}" method="post"]
      HexletCode::Tag.format_paired_tags('form', options, '', "\n")
    end

    def action(options) = options[ACTIONS_OPTION] || DEFAULT_ACTION
  end
end
