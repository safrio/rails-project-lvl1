# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/error'
require_relative 'hexlet_code/config'
require 'haml'
require 'haml/template/options'

module HexletCode
  def initialize(*args)
    Haml::Options.defaults[:attr_wrapper] = '"'
    Haml::Options.defaults[:format] = :xhtml
    super
  end

  class << self
    attr_accessor :elements, :form_attrs, :data

    def form_for(data, url: '#', method: 'post', &block)
      @elements = []
      @data = data
      @form_attrs = { method: method, action: url }

      block&.call(self)

      Haml::Engine.new(form_template).render(form)
    end

    def input(name, opts = {})
      elements << { name: name, value: data[name], opts: opts, type: get_type_by_opts(opts) }
    end

    def submit(opts = {}) = elements << { type: :submit, opts: opts }

    private

    def get_type_by_opts(opts) = opts[:as]&.to_sym == :text ? :textarea : :text

    def form
      Struct.new(:elements, :form_attrs, keyword_init: true)
            .new(elements: elements, form_attrs: @form_attrs)
    end

    def form_template = File.read("#{Config::TEMPLATES}/form.html.haml")
  end
end
