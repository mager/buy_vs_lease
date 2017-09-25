import { combineReducers } from 'redux';
import { reducer as form } from 'redux-form';
import vehicles from './vehicles';

const appReducer = combineReducers({
  form,
  vehicles,
});

export default function(state, action) {
  if (action.type === 'LOGOUT') {
    return appReducer(undefined, action);
  }
  return appReducer(state, action);
}
