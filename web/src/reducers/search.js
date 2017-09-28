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
    default:
      return state;
  }
}
