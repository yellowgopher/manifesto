module Jekyll
  module ManifestoPageListFilter
    def manifesto_page_list(input)
      pages = input.select do |x|
        x.data["layout"] == "policy"
      end
      pages.sort! do |a, b|
        if a.data["float"] == b.data["float"]
          a.data["title"] <=> b.data["title"]
        else
          (b.data["float"] || 0).to_i <=> (a.data["float"] || 0).to_i
        end
      end
      puts pages.inspect
      pages
    end
  end
end

Liquid::Template.register_filter(Jekyll::ManifestoPageListFilter)
