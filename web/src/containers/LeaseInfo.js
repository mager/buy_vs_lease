import React, { Component } from 'react';
import { Field, FieldArray } from 'redux-form';

import TextField from '../components/TextField';

const RadioFields = ({ fields }) => {
  const choices = fields.map(field => {
    console.log(field);
    return <Field name={field} component={RadioField} label={field} />;
  });

  // const choices = (
  //   <div className="control">
  //     <Field component={RadioField} label="24 Month" />
  //     <Field component={RadioField} label="36 Month" />
  //   </div>
  // );
  return <div className="control">{choices}</div>;
};

const RadioField = props => {
  return (
    <label className="radio">
      <input type="radio" name={props.input.name} />
      {props.label}
    </label>
  );
};

class LeaseInfo extends Component {
  render() {
    return (
      <section className="section LeaseInfo">
        <h5 className="title">Tell us about your current lease</h5>
        <Field name="downPayment" component={TextField} label="Down Payment" />
        <Field
          name="monthlyPayment"
          component={TextField}
          label="Monthly Payment"
        />
        <FieldArray
          name="leaseTerm"
          component={RadioFields}
          label="Lease Term"
        />
      </section>
    );
  }
}

export default LeaseInfo;
