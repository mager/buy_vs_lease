import axios from 'axios';

const API_URL = 'http://localhost:4000/api';

export const fetchVehicle = (year, make, model) => async dispatch => {
  try {
    const response = await axios.get(
      `${API_URL}/search?year=${year}&make=${make}&model=${model}`,
    );

    const vehicle = response.data.data[0];

    dispatch({
      type: 'FETCH_VEHICLE_SUCCESS',
      vehicle,
    });
  } catch (error) {
    dispatch({
      type: 'FETCH_VEHICLE_FAILURE',
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

export const fetchMakes = year => async dispatch => {
  const { data } = await axios.get(`${API_URL}/makes?year=${year}`);

  dispatch({
    type: 'FETCH_MAKES_SUCCESS',
    makes: data.makes,
  });
};

export const fetchModels = (year, make) => async dispatch => {
  const { data } = await axios.get(
    `${API_URL}/models?year=${year}&make=${make}`,
  );

  dispatch({
    type: 'FETCH_MODELS_SUCCESS',
    models: data.models,
  });
};

export const createAnalysis = data => async dispatch => {
  const response = await axios.post(`${API_URL}/analysis`, { analysis: data });

  console.log(response);

  // dispatch({
  //   type: 'FETCH_MODELS_SUCCESS',
  //   models: data.models,
  // });
};
