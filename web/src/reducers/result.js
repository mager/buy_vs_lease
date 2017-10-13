export default function(state = null, action) {
  switch (action.type) {
    case 'FETCH_ANALYSIS_RESULT_SUCCESS':
      console.log('yolo');
      console.log(action);
      return action.payload;
    default:
      return state;
  }
}
