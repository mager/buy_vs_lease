import axios from 'axios';

const API_URL = 'http://localhost:4000/api';

export const fetchVehicles = data => async dispatch => {
  console.log(data);
  try {
    const response = await axios.get(`${API_URL}/search`, { params: data });
    const vehicles = response.data.data;

    dispatch({
      type: 'FETCH_VEHICLES_SUCCESS',
      vehicles,
    });
  } catch (error) {
    dispatch({
      type: 'FETCH_VEHICLES_FAILURE',
      error,
    });
  }
};
