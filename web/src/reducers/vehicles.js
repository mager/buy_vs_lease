export default function(state = [], action) {
  switch (action.type) {
    case 'FETCH_VEHICLES_SUCCESS':
      return action.vehicles;
    default:
      return state;
  }
}
