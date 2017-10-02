import React, { Component } from 'react';
import { connect } from 'react-redux';

class VehicleResult extends Component {
  renderVehicleResult() {
    const { search: { vehicle } } = this.props;

    if (vehicle) {
      const { id, year, make, model } = vehicle;
      return `You selected ${id} ${year} ${make} ${model}`;
    }

    return undefined;
  }

  render() {
    return (
      <section className="section VehicleResult">
        <p>{this.renderVehicleResult()}</p>
      </section>
    );
  }
}

const mapStateToProps = state => ({
  search: state.search,
});

export default connect(mapStateToProps, undefined)(VehicleResult);
