import { combineReducers } from 'redux';
import { reducer as form } from 'redux-form';
import search from './search';
import result from './result';

const appReducer = combineReducers({
  form,
  search,
  result,
});

export default function(state, action) {
  if (action.type === 'LOGOUT') {
    return appReducer(undefined, action);
  }
  return appReducer(state, action);
}
