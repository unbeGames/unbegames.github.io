# frozen_string_literal: true

module Unbegames
  class ReleaseNotesGenerator < Jekyll::Generator
    safe true
    priority :low

    REQUIRED_FIELDS = %w[game version release_date lang title permalink].freeze

    def generate(site)
      collection = site.collections.fetch("release_notes")
      releases = build_index(collection.docs)

      site.posts.docs.each do |post|
        reference = post.data["release_notes"]
        next unless reference

        release = resolve_release(releases, reference, post.data["lang"])
        validate_post_reference(post, release)
        embed_release(post, release)
      end
    end

    private

    def build_index(documents)
      documents.each_with_object({}) do |document, index|
        missing = REQUIRED_FIELDS.reject { |field| document.data[field] }
        unless missing.empty?
          raise Jekyll::Errors::FatalException,
                "#{document.relative_path}: missing release-note fields: #{missing.join(', ')}"
        end

        key = release_key(document.data["game"], document.data["version"], document.data["lang"])
        if index.key?(key)
          raise Jekyll::Errors::FatalException, "Duplicate release note: #{key}"
        end

        index[key] = document
      end
    end

    def resolve_release(releases, reference, lang)
      game, version = reference.split("/v", 2)
      if game.to_s.empty? || version.to_s.empty?
        raise Jekyll::Errors::FatalException,
              "Invalid release_notes reference '#{reference}'; expected game/vVERSION"
      end

      releases[release_key(game, version, lang)] || releases[release_key(game, version, "en")] ||
        raise(Jekyll::Errors::FatalException, "Release note not found: #{reference} (#{lang} or en)")
    end

    def validate_post_reference(post, release)
      return if post.data["game"] == release.data["game"]

      raise Jekyll::Errors::FatalException,
            "#{post.relative_path}: game does not match release note #{post.data['release_notes']}"
    end

    def embed_release(post, release)
      heading = "## [#{release.data['title']}](#{release.data['permalink']})"
      post.content = "#{post.content.rstrip}\n\n---\n\n#{heading}\n\n#{release.content.lstrip}"
      post.data["release_notes_url"] = release.data["permalink"]
      post.data["release_notes_lang"] = release.data["lang"]
    end

    def release_key(game, version, lang)
      "#{game}/v#{version.to_s.delete_prefix('v')}/#{lang}"
    end
  end
end
