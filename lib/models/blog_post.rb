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
      content.nil? || header.nil? || created_at.nil?
    end

    def data_filename
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
        data_url:  "data/posts/#{data_filename}"
      }
    end

    private

    def name
      "#{created_at.to_i}-#{header.gsub(/\s+/, '_')}" # TODO this is a hack
    end

    attr_reader :header, :content, :created_at
  end
end
