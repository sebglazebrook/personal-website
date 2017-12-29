class BlogRepository {

  static all() {
    return window.blogData;
  }

  static findByUrl(url) {
    return (
      window.blogData.find((data) => {
        return data.url == url;
      })
    );
  }

}

export default BlogRepository;
