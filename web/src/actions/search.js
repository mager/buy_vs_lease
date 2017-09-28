import axios from 'axios';

const API_URL = 'http://localhost:4000/api';

export const fetchVehicles = data => async dispatch => {
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

export const fetchYears = () => async dispatch => {
  const { data } = await axios.get(`${API_URL}/years`);

  dispatch({
    type: 'FETCH_YEARS_SUCCESS',
    years: data.years,
  });
};
