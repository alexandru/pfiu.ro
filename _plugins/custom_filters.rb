require "nokogiri"

def to_absolute_url(site, url)
  if url =~ /^\//
    site['url'] + site['baseurl'] + url
  else
    url
  end
end

module Jekyll
  module MyDateFilter
    @@ro_months = {
      '1': 'ianuarie',
      '2': 'februarie',
      '3': 'martie',
      '4': 'aprilie',
      '5': 'mai',
      '6': 'iunie',
      '7': 'iulie',
      '8': 'august',
      '9': 'septembrie',
      '10': 'octombrie',
      '11': 'noiembrie',
      '12': 'decembrie'
    }

    def ro_date_to_long_string(date)
      parsed = time(date)
      m = @@ro_months[parsed.strftime("%-m").to_sym]
      d = parsed.strftime("%-d")
      y = parsed.strftime("%Y")
      d + " " + m + " " + y
    end
  end

  module MyRSSFilter
    @@site = Jekyll.configuration({})

    def rss_process(html)
      doc = Nokogiri::HTML(html)

      doc.css("img").each do |elem|
        elem["src"] = to_absolute_url(@@site, elem['src'])
        elem["style"] = "max-width: 100%; " + (elem["style"] || "")
      end

      doc.css("iframe").each do |elem|
        elem["style"] = "max-width: 100%; " + (elem["style"] || "")
      end

      doc.css("figure").each do |elem|
        elem["style"] = "max-width: 100%; " + (elem["style"] || "")
      end

      doc.css("a").each do |elem|
        elem["href"] = to_absolute_url(@@site, elem['href'])
      end

      doc.css("figcaption").each do |elem|
        elem.inner_html = "<p><em>" + elem.inner_html + "</em></p>"
      end

      body = doc.at_css("body")
      body ? doc.at_css("body").inner_html : ""
    end
  end
end

Liquid::Template.register_filter(Jekyll::MyDateFilter)
Liquid::Template.register_filter(Jekyll::MyRSSFilter)
