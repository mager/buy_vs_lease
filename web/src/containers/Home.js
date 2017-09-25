// @flow
import React, { Component } from 'react';

import CarSearch from '../containers/CarSearch';
import SearchResults from '../containers/SearchResults';

class Home extends Component {
  render() {
    return (
      <div className="Home">
        <CarSearch />
        <SearchResults />
      </div>
    );
  }
}

export default Home;
