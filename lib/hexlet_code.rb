# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/error'

module HexletCode
  LINE_SPLITTER = "\n"

  class << self
    attr_accessor :inputs, :obj

    def form_for(obj, url: '#', method: 'post', &block)
      raise HexletCodeError, 'Object has not Struct parent' unless obj.class.ancestors.include? Struct

      @inputs = []
      @obj = obj
      block&.call(self)

      options = get_action(url, method)
      block = inputs.join LINE_SPLITTER
      HexletCode::Tag.format_paired_tags('form', options, block, LINE_SPLITTER)
    end

    def input(name, as: nil, cols: 20, rows: 40)
      value = obj[name]
      return inputs << render_textarea(name, value, cols, rows) if as == :text

      inputs << render_input(name, value)
    end

    private

    def get_action(url, method) = %( action="#{url}" method="#{method}")

    def render_input(name, value)
      options = HexletCode::Tag.render_options([name: name, type: 'text', value: value])
      HexletCode::Tag.format_single_tag('input', options)
    end

    def render_textarea(name, value, cols, rows)
      options = HexletCode::Tag.render_options([cols: cols, rows: rows, name: name])
      HexletCode::Tag.format_paired_tags('textarea', options, value)
    end
  end
end
