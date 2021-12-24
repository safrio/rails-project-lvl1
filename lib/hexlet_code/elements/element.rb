# frozen_string_literal: true

module HexletCode
  class Element
    attr_accessor :name, :value, :attrs

    def label(attrs)
      Tag.build('label', { for: attrs[:name] }) { attrs[:name].capitalize }
    end
  end
end
