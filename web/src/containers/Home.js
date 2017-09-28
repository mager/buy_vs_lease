// @flow
import React, { Component } from 'react';

import CarSearch from '../containers/CarSearch';

class Home extends Component {
  render() {
    return (
      <div className="Home">
        <CarSearch />
      </div>
    );
  }
}

export default Home;
