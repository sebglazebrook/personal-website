require "factories/blog_post_factory"
require "json"

module Repositories
  class BlogPostRepository

    class << self

      def all
        data_dir.entries.map do |entry|
          Factories::BlogPostFactory.create_from_file(data_dir.join(entry)) rescue nil
        end.compact
      end

      def save(blog_post)
        data_dir.join(blog_post.data_filename).write(JSON.pretty_generate(blog_post.as_json))
      end

      private


      def data_dir
        PROJECT_DIR.join("dist", "data", "posts")
      end

    end
  end
end
