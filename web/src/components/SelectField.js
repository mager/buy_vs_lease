import React from 'react';
import classnames from 'classnames';

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

export default SelectField;
