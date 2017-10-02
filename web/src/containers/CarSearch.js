import React, { Component } from 'react';
import styled from 'styled-components';
import { reduxForm, Field, formValueSelector } from 'redux-form';
import { connect } from 'react-redux';
import classnames from 'classnames';

import {
  fetchVehicle,
  fetchYears,
  fetchMakes,
  fetchModels,
} from '../actions/search';
import SearchResults from './SearchResults';

const CarSearchForm = styled.form`
  display: flex;
  justify-content: space-between;
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

    /* TODO(mager): Don't hard-code current year */
    await fetchMakes(2017);
  }

  onUpdateYear = async event => {
    const { fetchMakes } = this.props;
    const currentYear = event.target.value;

    await fetchMakes(currentYear);
  };

  onUpdateMake = async event => {
    const { fetchModels, currentYear } = this.props;
    const currentMake = event.target.value;

    await fetchModels(currentYear, currentMake);
  };

  onUpdateModel = async event => {
    const { fetchVehicle, currentYear, currentMake } = this.props;
    const currentModel = event.target.value;

    await fetchVehicle(currentYear, currentMake, currentModel);
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

  renderModels() {
    const { search } = this.props;
    const models = search.models;
    console.log(models);

    if (models) {
      return models.map(model => (
        <option name={model} key={model}>
          {model}
        </option>
      ));
    }

    return undefined;
  }

  render() {
    return (
      <section className="section CarSearch">
        <h3 className="title">Should you buy or lease?</h3>

        <CarSearchForm>
          <Field
            name="year"
            component={SelectField}
            type="select"
            onChange={this.onUpdateYear}
          >
            <option value="Choose a year" selected="selected">
              Choose a Year
            </option>
            {this.renderYears()}
          </Field>
          <Field
            name="make"
            component={SelectField}
            type="select"
            onChange={this.onUpdateMake}
          >
            <option value="Choose a make" selected="selected">
              Choose a make
            </option>
            {this.renderMakes()}
          </Field>
          <Field
            name="model"
            component={SelectField}
            type="select"
            onChange={this.onUpdateModel}
          >
            <option value="Choose a model" selected="selected">
              Choose a model
            </option>
            {this.renderModels()}
          </Field>
        </CarSearchForm>
        <SearchResults />
      </section>
    );
  }
}

const mapStateToProps = state => {
  const selector = formValueSelector('CarSearch');

  return {
    search: state.search,
    currentYear: selector(state, 'year') || 2017,
    currentMake: selector(state, 'make') || 'Nissan',
    currentModel: selector(state, 'model'),
  };
};

CarSearch = connect(mapStateToProps, {
  fetchVehicle,
  fetchYears,
  fetchMakes,
  fetchModels,
})(CarSearch);

export default reduxForm({
  form: 'CarSearch',
})(CarSearch);
