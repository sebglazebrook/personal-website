require "factories/blog_post_factory"
require "json"

module Repositories
  class BlogPostRepository

    class << self

      def all
        data_dir.entries.map do |entry|
          if entry.to_s =~ /^\d{10}-/ # TODO remove the if?
            Factories::BlogPostFactory.create_from_file(data_dir.join(entry))
          end
        end.compact
      end

      def save(blog_post)
        data_dir.join(blog_post.file_name).write(JSON.pretty_generate(blog_post.as_json))
      end

      private


      def data_dir
        PROJECT_DIR.join("dist", "data", "posts")
      end

    end
  end
end
