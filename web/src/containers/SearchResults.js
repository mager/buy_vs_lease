import React, { Component } from 'react';
import { connect } from 'react-redux';

class SearchResults extends Component {
  renderSearchResults() {
    const { vehicles } = this.props;

    if (vehicles.length) {
      return vehicles.map(({ id, year, make, model, trim }) => {
        const fullName = `${year} ${make} ${model} ${trim}`;
        return <div key={id}>{fullName}</div>;
      });
    }

    return undefined;
  }

  render() {
    return (
      <section className="section SearchResults">
        {this.renderSearchResults()}
      </section>
    );
  }
}

const mapStateToProps = state => ({
  vehicles: state.vehicles,
});

export default connect(mapStateToProps, undefined)(SearchResults);
