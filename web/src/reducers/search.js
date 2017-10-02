export default function(
  state = {
    years: [],
  },
  action,
) {
  switch (action.type) {
    case 'FETCH_YEARS_SUCCESS':
      return {
        ...state,
        years: action.years,
      };
    case 'FETCH_MAKES_SUCCESS':
      return {
        ...state,
        makes: action.makes,
      };
    case 'FETCH_MODELS_SUCCESS':
      return {
        ...state,
        models: action.models,
      };
    case 'FETCH_VEHICLE_SUCCESS':
      return {
        ...state,
        vehicle: action.vehicle,
      };
    default:
      return state;
  }
}
