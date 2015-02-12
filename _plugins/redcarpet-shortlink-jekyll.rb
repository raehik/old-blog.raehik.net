class Jekyll::Converters::Markdown::RedcarpetShortlink
  def initialize(config)
    require '/home/raehik/bin/redcarpet-shortlink.rb'
    @config = config
  rescue LoadError
    STDERR.puts 'redcarpet-shortlink.rb is missing. Grab it from https://github.com/raehik/redcarpet-shortlink'
    raise FatalException.new("Missing dependency: redcarpet-shortlink.rb")
  end

  def convert(content)
    Redcarpet::Markdown.new(
      HTMLWithShortlinks.new(
        render_options = { with_toc_data: true }),
      extensions = {
        no_intra_emphasis: true,
        strikethrough: true,
        footnotes: true,
        autolink: true
    }).render(content)
  end
end
