import React, { Component } from 'react';
import styled from 'styled-components';
import { reduxForm, Field } from 'redux-form';
import { connect } from 'react-redux';

import { fetchVehicles } from '../actions/vehicles';

const CarSearchForm = styled.form`
  display: grid;
  grid-template-columns: 10% 20% auto 10%;
  grid-column-gap: 10px;
`;

const TextField = props => {
  return (
    <div className="field">
      <div className="control">
        <input
          {...props.input}
          className="input"
          type="text"
          placeholder={props.placeholder}
          name={props.name}
        />
      </div>
    </div>
  );
};

class CarSearch extends Component {
  handleSubmit = data => {
    this.props.fetchVehicles(data);
  };

  render() {
    const { handleSubmit } = this.props;

    return (
      <section className="section CarSearch">
        <h3 className="title">Search for a vehicle:</h3>

        <CarSearchForm onSubmit={handleSubmit(this.handleSubmit)}>
          <Field
            name="year"
            component={TextField}
            type="text"
            placeholder="Year"
          />
          <Field
            name="make"
            component={TextField}
            type="text"
            placeholder="Make"
          />
          <Field
            name="model"
            component={TextField}
            type="text"
            placeholder="Model"
          />
          <button className="button" type="submit">
            Search
          </button>
        </CarSearchForm>
      </section>
    );
  }
}

CarSearch = connect(undefined, { fetchVehicles })(CarSearch);

export default reduxForm({
  form: 'CarSearch',
})(CarSearch);
