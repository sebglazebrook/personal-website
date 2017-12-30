require "models/blog_roll"
require "repositories/blog_post_repository"

module Repositories
  class BlogRollRepository

    def self.rebuild
      blog_roll = Models::BlogRoll.new
      blog_posts = Repositories::BlogPostRepository.all
      blog_roll.blog_posts = blog_posts # TODO tell don't ask?
      blog_roll.save
    end

    def self.save(blog_roll)
      data_dir.join("index.js").write(blog_roll.to_json)
    end

    def self.data_dir
      PROJECT_DIR.join("dist", "data", "posts")
    end

  end
end
