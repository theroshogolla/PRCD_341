import axios from 'axios'

const baseUrl = 'http://localhost:5000'

const searchQuery = (query) => {
  return axios
         .get(`${baseUrl}/search/`, {
           params: {
             query
           }
         })
         .then(response => response)
}

const getShifts = (date) => {
  return axios
         .get(`${baseUrl}/shifts/${date}`)
         .then(response => response)
}

export {getShifts, searchQuery}
