module Jekyll
  module WhereFilter
    def where(input, property, value)
      input.select {|x| x.data[property] == value}
    end
  end
end

Liquid::Template.register_filter(Jekyll::WhereFilter)
