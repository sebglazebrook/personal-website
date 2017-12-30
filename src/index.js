import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter as Router, Route, Link } from 'react-router-dom';
import Homepage from './homepage';
import BlogRepository from './blog-repository';
import BlogPostFactory from './blog-post-factory';


ReactDOM.render(
  <div>
    <a href="/">SebGlazebrook.com</a>
    <Router>
      <div>
        <Route exact path="/" component={Homepage} />
        {
          BlogRepository.all().map((blogPost, index) => {
            return (<Route path={blogPost.url} component={BlogPostFactory} key={index} />)
          })
        }
      </div>
    </Router>
  </div>,
    document.getElementById('main-container')
);
