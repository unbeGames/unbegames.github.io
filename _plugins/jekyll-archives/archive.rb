module Jekyll
  module Archives
    class Archive < Jekyll::Page
      attr_accessor :lang

      ATTRIBUTES_FOR_LIQUID = %w(
        posts
        type
        title
        date
        name
        path
        url
        permalink
        lang
      ).freeze
  
         # Initialize a new Archive page
      #
      # site  - The Site object.
      # title - The name of the tag/category or a Hash of the year/month/day in case of date.
      #           e.g. { :year => 2014, :month => 08 } or "my-category" or "my-tag".
      # type  - The type of archive. Can be one of "year", "month", "day", "category", or "tag"
      # posts - The array of posts that belong in this archive.
      def initialize(site, title, type, posts, lang = "en")    
        @site   = site
        @posts  = posts
        @type   = type
        @title  = title
        @lang = lang
        @config = site.config["jekyll-archives"]
        @slug   = slugify_string_title

        # Use ".html" for file extension and url for path
        @ext  = File.extname(relative_path)
        @path = relative_path
        @name = File.basename(relative_path, @ext)

        @data = {
          "layout" => layout,
        }
        @content = ""
      end
      
      def permalink
        link = data&.is_a?(Hash) && data["permalink"]
        unless link.nil?
          link.sub(':lang', lang)
        end
      end

      # Returns a hash of URL placeholder names (as symbols) mapping to the
      # desired placeholder replacements. For details see "url.rb".
      def url_placeholders
        if @title.is_a? Hash
          @title.merge(:type => @type, :lang => @lang)
        else
          { :name => @slug, :type => @type, :lang => @lang }
        end
      end

      # Generate slug if @title attribute is a string.
      #
      # Note: mode other than those expected by Jekyll returns the given string after
      # downcasing it.
      def slugify_string_title
        return unless title.is_a?(String)

        Utils.slugify(title, :mode => @config["slug_mode"])
      end
    end
  end
end
