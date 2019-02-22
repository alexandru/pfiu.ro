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
end

Liquid::Template.register_filter(Jekyll::MyDateFilter)