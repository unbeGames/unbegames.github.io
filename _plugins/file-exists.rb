# https://talk.jekyllrb.com/t/how-to-check-if-a-certain-path-url-exists-in-the-generated-output-by-jekyll/8954/2

module Jekyll
  class FileExistsTag < Liquid::Tag

    def initialize(tag_name, path, tokens)
      super
      @path = path
    end

    def render(context)
      # Pipe parameter through Liquid to make additional replacements possible
      url = Liquid::Template.parse(@path).render context

      # Adds the site source, so that it also works with a custom one
      site_source = context.registers[:site].config['source']
      file_path = File.join(site_source, url)

      # Check if file exists (returns true or false)
      "#{File.exist?(file_path.strip!)}"
    end
  end
end

Liquid::Template.register_tag('file_exists', Jekyll::FileExistsTag)