module Models
  class BlogPost

    def initialize(header:, content:, created_at:)
      @header = header
      @content = content
      @created_at = created_at
    end

    def save
      Repositories::BlogPostRepository.save(self)
    end

    def valid?
      !invalid?
    end

    def invalid?
      instance_variables.any? { |variable| variable.nil? }
    end

    # TODO need a better name for name
    def name
      "#{created_at.to_i}-#{header.gsub(/\s+/, '_')}" # TODO this is a hack
    end

    # TODO need a better name for file_name
    def file_name
      "#{name}.json"
    end

    def content_snippet
      content[0..100]
    end

    def as_json
      {
        header: header,
        content: content,
        content_snippet: content_snippet,
        created_at: created_at,
        url:  "/posts/#{name}",
        data_url:  "data/posts/#{file_name}"
      }
    end

    private

    attr_reader :header, :content, :created_at
  end
end
