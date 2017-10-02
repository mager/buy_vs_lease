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
    default:
      return state;
  }
}
