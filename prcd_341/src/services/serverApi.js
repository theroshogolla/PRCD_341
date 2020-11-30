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
         .get(`${baseUrl}/shifts/`, {
           params: {
             date
           }
         })
         .then(response => response)
}

const sendSignUp = (caseID, name, cell, email, type, shiftTime) => {
  return axios
         .post(`${baseUrl}/signup/`, {
         caseID,
         name,
         cell,
         email,
         type,
         shiftTime
        })
         .then(response => response)
}

export {getShifts, searchQuery, sendSignUp}
