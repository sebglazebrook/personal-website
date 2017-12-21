import React, { Component } from 'react';
import BlogRepository from './blog-repository';
import BlogPost from './blog-post';

class BlogPostFactory extends Component {

  render() {
    return ( <BlogPost {...BlogRepository.findByUrl(this.props.match.url)} />);
  }

}

export default BlogPostFactory;
