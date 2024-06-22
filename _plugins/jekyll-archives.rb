# frozen_string_literal: true

require "jekyll"

module Jekyll
  module Archives
    class Archives < Jekyll::Generator
      def read_tags
        if enabled? "tags"
          tags.each do |title, posts|
            posts.group_by{ |p| p.data['lang'] }.map do |lang, p|
              @archives << Archive.new(@site, title, "tag", posts, lang)
            end
          end
        end
      end

      def read_categories
        if enabled? "categories"
          categories.each do |title, posts|
            posts.group_by{ |p| p.data['lang'] }.map do |lang, p|
              @archives << Archive.new(@site, title, "category", posts, lang)
            end
          end
        end
      end
    end
  end
end
