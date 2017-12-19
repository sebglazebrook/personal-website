let blogData = [
  { header: "header first", content: "content here", url: "/posts/first" },
  { header: "header second", content: "content here", url: "/posts/second" },
  { header: "header third", content: "content here", url: "/posts/third" },
];

class BlogRepository {

  static all() {
    return (blogData);
  }

  static findByUrl(url) {
    return (
      blogData.find((data) => {
        return data.url == url;
      })
    );
  }

}

export default BlogRepository;
