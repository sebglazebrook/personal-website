const blogData = [
  { header: "header first", content: "content here", url: "/posts/first", dataUrl: "/data/posts/first.json" },
  { header: "header second", content: "content here", url: "/posts/second", dataUrl: "/data/posts/second.json" },
  { header: "header third", content: "content here", url: "/posts/third", dataUrl:  "/data/posts/third.json"},
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
