import React, { Component } from 'react';
import Request from 'superagent';
import ReactMarkdown from "react-markdown";

class BlogPost extends Component {

  constructor(props) {
    super(props);
    this.state = {loading: true};
  }

  componentDidMount() {
    const that = this;
    Request
      .get(this.props.data_url)
      .then(function(response) {
        if (response.ok) {
          that.setState({loading: false, errorLoadingData: false, data: JSON.parse(response.text)});
        } else {
          that.setState({loading: false, errorLoadingData: true});
        }
      });
  }

  loadingData() {
    return (
      <div>Loading...</div>
    );
  }

  renderedBlogPost() {
    return (
      <div>
        <div>{this.state.data.header}</div>
        <ReactMarkdown source={this.state.data.content} />
      </div>
    );
  }

  errorLoadingData() {
    return (
      <div>Error loading data. Sorry.</div>
    );
  }

  render() {
    if (this.state.loading) { return this.loadingData() };
    if (this.state.errorLoadingData) { return this.errorLoadingData() };
    return this.renderedBlogPost();
  }

}

export default BlogPost;
