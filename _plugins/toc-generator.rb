require 'nokogiri'

module Jekyll
  module TOCGenerator
    def toc(html)
      # header range you want to look for
      # (some people might want h1, some might need h5, etc.)
      h_first = 2
      h_last = 4

      # generate range for xpath
      header_parts = []
      (h_first..h_last).each do |n|
        header_parts << "//h#{n}"
      end
      headers = header_parts.join(" | ")

      # get all headers in the document using Nokogiri
      document_headers = Nokogiri::HTML(html).xpath(headers)

      # if no headers, return nuttin'
      if document_headers.length == 0
        return ""
      end

      # set starting level = the lowest one we expect
      prev_level = h_first

      # begin table
      toc = ['<nav class="toc">', '<ul>']

      # required to stop closing nothing at the start of the list
      header_num = 0
      document_headers.each do |header|
        # TODO: redo this to work 1 in advance, so we know when to end
        #       <li> tags and when not to, & to get better HTML output
        #       (really it'll only fix 1 bug, which is if someone skips
        #       a header level, but atm it's pretty ugly HTML)

        header_num += 1

        # get this header's level (i.e. number part of hX)
        level = header.to_s[2].to_i

        # reset close tag
        close_tag = ""

        # if level is lower than first (e.g. found an h1 where there
        # shouldn't be any in the document content), skip that header
        next if level < h_first

        # do list indents
        # TODO: make this neater somehow
        if level > prev_level
          until prev_level == level
            toc << "<ul>"
            prev_level += 1
          end
        elsif level < prev_level
          until prev_level == level
            toc << "</li>"
            toc << "</ul>"
            prev_level -= 1
          end
        elsif header_num != 1
          close_tag = "</li>"
        end

        toc << close_tag + '<li><a href="#' + header['id'] + '">' + header.text + '</a>'
      end

      # close any open list tags (e.g. from ending on an h4)
      if prev_level > h_first
        until prev_level == h_first
          toc << '</li>'
          toc << '</ul>'
          prev_level -= 1
        end
      end

      # finish up
      toc << ['</ul>', '</nav>']
      return toc.join("\n")
    end
  end
end

Liquid::Template.register_filter(Jekyll::TOCGenerator)
