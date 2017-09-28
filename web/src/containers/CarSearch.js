import React, { Component } from 'react';
import styled from 'styled-components';
import { reduxForm, Field } from 'redux-form';
import { connect } from 'react-redux';

import { fetchVehicles, fetchYears } from '../actions/search';

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

const SelectField = props => {
  return (
    <div className="field">
      <div className="select">
        <select {...props.input} className="select" name={props.name}>
          {props.children}
        </select>
      </div>
    </div>
  );
};

class CarSearch extends Component {
  componentDidMount() {
    const { fetchYears } = this.props;

    fetchYears();
  }

  handleSubmit = data => {
    this.props.fetchVehicles(data);
  };

  renderYears() {
    const { years } = this.props.search;
    return years.length
      ? years.map(year => (
          <option name={year} key={year}>
            {year}
          </option>
        ))
      : null;
  }

  render() {
    const { handleSubmit } = this.props;

    return (
      <section className="section CarSearch">
        <h3 className="title">Search for a vehicle:</h3>

        <CarSearchForm onSubmit={handleSubmit(this.handleSubmit)}>
          <Field name="year" component={SelectField} type="select">
            {this.renderYears()}
          </Field>
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

const mapStateToProps = state => {
  return {
    search: state.search,
  };
};

CarSearch = connect(mapStateToProps, { fetchVehicles, fetchYears })(CarSearch);

export default reduxForm({
  form: 'CarSearch',
})(CarSearch);
