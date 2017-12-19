import React, { Component } from 'react';

let blogPostsData = [
  { header: "header here", content: "content here" },
  { header: "header here", content: "content here" },
  { header: "header here", content: "content here" },
]

class BlogPostSnippet extends Component {

  render() {
    return (
      <div>
        <div>{this.props.blogPostData.header}</div>
        <div>{this.props.blogPostData.content}</div>
        <a href="#foo">Read more</a>
      </div>
    );
  }

}

class BlogRoll extends Component {

  blogPostSnippets() {
    return (
      <div>
        {
          blogPostsData.map((blogPostData, index) => {
            return (
              <div key={index}>
                <BlogPostSnippet blogPostData={blogPostData} />
              </div>
            );
          })
        }
      </div>
    );
  }

  render() {
    return (
      <div>
        { this.blogPostSnippets() }
      </div>
    );
  }

}

export default BlogRoll;
