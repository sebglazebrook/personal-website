require "factories/blog_post_factory"
require "repositories/blog_roll_repository"

module Commands
  class AddNewBlogPost

    def initialize(blog_post_data)
      @blog_post_data = blog_post_data
    end

    def call
      create_blog_post
      update_blog_roll
      update_index_html
    end

    private

    def create_blog_post
      Factories::BlogPostFactory.create(@blog_post_data)
    end

    def update_blog_roll
      Repositories::BlogRollRepository.rebuild
    end

    def update_index_html
      index_contents = PROJECT_DIR.join("dist", "index.html").read
      blog_data_contents = PROJECT_DIR.join("dist", "data", "posts", "index.js").read
      load_data =
"""
<!-- Insert Data for initial load below here -->
<script>
  var rawData = '#{blog_data_contents}';
  window.blogData = JSON.parse(rawData)['posts'];
</script>
<!-- Insert Data for initial load above here -->
"""
      new_index_contents = index_contents.gsub(/<!-- Insert Data for initial load below here -->.*<!-- Insert Data for initial load above here -->?/m, load_data)
      PROJECT_DIR.join("dist", "index.html").write(new_index_contents)
    end

  end
end
