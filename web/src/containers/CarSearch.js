import React, { Component } from 'react';
import styled from 'styled-components';
import { reduxForm, Field, formValueSelector } from 'redux-form';
import { connect } from 'react-redux';
import classnames from 'classnames';

import { fetchVehicles, fetchYears, fetchMakes } from '../actions/search';

const CarSearchForm = styled.form`
  display: grid;
  grid-template-columns: 100px auto auto 10%;
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
  const classes = classnames({
    select: true,
    'is-loading': props.years,
  });

  return (
    <div className="field">
      <div className={classes}>
        <select {...props.input} name={props.name}>
          {props.children}
        </select>
      </div>
    </div>
  );
};

class CarSearch extends Component {
  async componentDidMount() {
    const { fetchYears, fetchMakes } = this.props;

    await fetchYears();

    /* TODO(mager): Use current year */
    await fetchMakes(2017);
  }

  handleSubmit = data => {
    this.props.fetchVehicles(data);
  };

  onUpdateYear = async event => {
    const { fetchMakes } = this.props;
    const currentYear = event.target.value;

    await fetchMakes(currentYear);
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

  renderMakes() {
    const { search } = this.props;
    const makes = search.makes;

    if (makes) {
      return makes.map(make => (
        <option name={make} key={make}>
          {make}
        </option>
      ));
    }

    return undefined;
  }

  render() {
    const { handleSubmit } = this.props;

    return (
      <section className="section CarSearch">
        <h3 className="title">Should you buy or lease?</h3>

        <CarSearchForm onSubmit={handleSubmit(this.handleSubmit)}>
          <Field
            name="year"
            component={SelectField}
            type="select"
            onChange={this.onUpdateYear}
          >
            {this.renderYears()}
          </Field>
          <Field name="make" component={SelectField} type="select">
            {this.renderMakes()}
          </Field>
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
  const selector = formValueSelector('CarSearch');

  return {
    search: state.search,
    currentYear: selector(state, 'year'),
  };
};

CarSearch = connect(mapStateToProps, { fetchVehicles, fetchYears, fetchMakes })(
  CarSearch,
);

export default reduxForm({
  form: 'CarSearch',
})(CarSearch);
