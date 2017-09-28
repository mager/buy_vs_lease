import { combineReducers } from 'redux';
import { reducer as form } from 'redux-form';
import search from './search';

const appReducer = combineReducers({
  form,
  search,
});

export default function(state, action) {
  if (action.type === 'LOGOUT') {
    return appReducer(undefined, action);
  }
  return appReducer(state, action);
}
