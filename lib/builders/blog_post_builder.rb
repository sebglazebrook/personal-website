require "models/blog_post"
require "time"

module Builders
  class BlogPostBuilder

    attr_accessor :header, :content
    attr_writer :created_at

    def created_at
      @created_at ? Time.parse(@created_at) : Time.now
    end

    def build!
      blog_post = Models::BlogPost.new(header: header, content: content, created_at: created_at)
      blog_post.valid? ? blog_post : raise(UnableToBuildBlogPost.new)
    end

    class UnableToBuildBlogPost < StandardError; end
  end
end
