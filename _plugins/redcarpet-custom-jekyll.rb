class Jekyll::Converters::Markdown::RedcarpetCustom
  def initialize(config)
    require '/home/raehik/bin/redcarpet-custom.rb'
    @config = config
  rescue LoadError
    STDERR.puts 'redcarpet-custom.rb is missing. Grab it from https://github.com/raehik/redcarpet-custom'
    raise FatalException.new("Missing dependency: redcarpet-custom.rb")
  end

  def convert(content)
    Redcarpet::Markdown.new(
      HTMLCustom.new(
        render_options = { with_toc_data: true }),
      extensions = {
        no_intra_emphasis: true,
        strikethrough: true,
        footnotes: true,
        autolink: true,
        fenced_code_blocks: true,
        superscript: true,
    }).render(content)
  end
end
