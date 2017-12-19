import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Homepage from './homepage';
import BlogRepository from './blog-repository';
import BlogPostFactory from './blog-post-factory';


ReactDOM.render(
   <Router>
     <div>
       <Route exact path="/" component={Homepage} />
       {
         BlogRepository.all().map((blogPost, index) => {
            return (<Route path={blogPost.url} component={BlogPostFactory} key={index} />)
         })
       }
     </div>
   </Router>,
    document.getElementById('main-container')
);
