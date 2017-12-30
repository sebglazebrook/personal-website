import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import BlogRepository from './blog-repository';

class BlogPostSnippet extends Component {

  render() {
    return (
      <div>
        <div>{this.props.blogPostData.header}</div>
        <div>{this.props.blogPostData.content_snippet}</div>
        <Link to={this.props.blogPostData.url}>Read more</Link>
      </div>
    );
  }

}

class BlogIndex extends Component {

  blogPostSnippets() {
    return (
      <div>
        {
          BlogRepository.all().map((blogPostData, index) => {
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

export default BlogIndex;
