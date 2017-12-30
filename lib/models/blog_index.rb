module Models
  class BlogIndex

    attr_writer :blog_posts

    def save
      Repositories::BlogIndexRepository.save(self)
    end

    def as_json
      posts = blog_posts.map do |blog_post|
        blog_post.as_json.select do |key, value|
          [:header, :url, :data_url, :content_snippet].include?(key)
        end
      end
      { posts: posts }
    end

    def to_json
      as_json.to_json
    end

    private

    attr_reader :blog_posts

  end
end
