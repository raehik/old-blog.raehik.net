# Original code from blakesmith's gist:
# https://gist.github.com/449509
#
# A Jekyll plugin which provides the Liquid tag render_time.
#
# In any of your pages, use the tag like so to insert the time at which
# the page was generated:
#
#     {% render_time Page generated at: %}
#

module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
