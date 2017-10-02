import React from 'react';

const TextField = props => {
  return (
    <div className="field">
      <div className="control">
        {props.label ? (
          <label className="label">{props.label}</label>
        ) : (
          undefined
        )}
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

export default TextField;
