import React, { Component } from 'react';
import { connect } from 'react-redux';

class SearchResults extends Component {
  renderSearchResults() {
    const { search: { vehicle } } = this.props;

    if (vehicle) {
      const { id, year, make, model } = vehicle;
      return `You selected ${id} ${year} ${make} ${model}`;
    }

    return undefined;
  }

  render() {
    return (
      <section className="section SearchResults">
        <p>{this.renderSearchResults()}</p>
      </section>
    );
  }
}

const mapStateToProps = state => ({
  search: state.search,
});

export default connect(mapStateToProps, undefined)(SearchResults);
