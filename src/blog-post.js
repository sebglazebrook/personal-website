import React, { Component } from 'react';

class BlogPost extends Component {

  render() {
    return (
      <div>
        <div>{ this.props.header }</div>
        <div>{ this.props.content }</div>
      </div>
    );
  }

}

export default BlogPost;
