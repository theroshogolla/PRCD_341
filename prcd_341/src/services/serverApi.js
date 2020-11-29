import axios from 'axios'

const baseUrl = 'http://localhost:5000'

const getShifts = (date) => {
  return axios
         .get(`${baseUrl}/shifts/${date}`)
         .then(response => response)
}

export {getShifts}
