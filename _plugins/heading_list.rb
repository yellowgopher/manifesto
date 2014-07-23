require 'nokogiri'

module Jekyll
  class HeadingListTag < Liquid::Tag

    def initialize(tag_name, tag, tokens)
      super
      @tag = tag
    end

    def render(context)
      output = "<ul>"
      doc = Nokogiri::HTML.parse(context["content"])
      doc.xpath("//#{@tag}").each do |x|
        output += "<li>"
        output += "<a href='##{x.attributes['id']}'>#{x.text.to_s}</a>"
        output += "</li>"
      end
      output += "</ul>"
    end
  end
end

Liquid::Template.register_tag('heading_list', Jekyll::HeadingListTag)
