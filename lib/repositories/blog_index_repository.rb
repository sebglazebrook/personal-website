require "models/blog_index"
require "repositories/blog_post_repository"

module Repositories
  class BlogIndexRepository

    def self.rebuild
      blog_index = Models::BlogIndex.new
      blog_posts = Repositories::BlogPostRepository.all
      blog_index.blog_posts = blog_posts
      blog_index.save
    end

    def self.save(blog_index)
      data_dir.join("index.js").write(blog_index.to_json)
    end

    def self.data_dir
      PROJECT_DIR.join("dist", "data", "posts")
    end

  end
end
