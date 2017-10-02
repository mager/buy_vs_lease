import React, { Component } from 'react';
import { Field } from 'redux-form';

import TextField from '../components/TextField';

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
        <label className="radio">
          <Field name="leaseTerm" component="input" type="radio" value="24" />24
          month
        </label>
        <label className="radio">
          <Field name="leaseTerm" component="input" type="radio" value="36" />
          36 month
        </label>
      </section>
    );
  }
}

export default LeaseInfo;
