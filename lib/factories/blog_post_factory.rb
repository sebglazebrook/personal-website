require "builders/blog_post_builder"
require "json"

module Factories
  class BlogPostFactory

    class << self

      def create(raw_data)
        json_data = parse_raw_data(raw_data)
        build_blog_post(json_data).save
      end

      def create_from_file(filepath)
        json_data = JSON.parse(File.read(filepath))
        build_blog_post(json_data)
      end

      private

      def parse_raw_data(raw_data)
        JSON.parse(raw_data)
      rescue StandardError => e
        message = "Unable to parse the input. Is it valid JSON?\nRaw exception:\n#{e.message}"
        raise UnparsableData.new(message)
      end

      def build_blog_post(json_data)
        builder = Builders::BlogPostBuilder.new
        builder.header = json_data["header"]
        builder.content = json_data["content"]
        builder.created_at = json_data["created_at"]
        builder.build!
      end

    end

    class UnparsableData < StandardError; end
  end
end
