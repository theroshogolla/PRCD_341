import React, {useState} from 'react'
import {TextField, Button} from '@material-ui/core'
import {makeStyles} from '@material-ui/styles'

import {searchQuery} from '../services/serverApi'
import history from '../services/history'

const useStyles = makeStyles({
  userSearch: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center'
  },
  userForm: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center'
  },
  userSearchBar: {
    width: 1000,
    height: 50,
    '& input:valid:focus + fieldset': {
      borderColor: 'white',
    },
    '& input:invalid:focus + fieldset': {
      borderColor: 'white',
    },
  },
  searchButton: {
    width: 100,
    height: 50,
    marginTop: 30
  },

})


const SearchForm = ({resultHandler}) => {
  const classes = useStyles()
  const [searchValue, setSearchValue] = useState('')
  const handleSearch = (e) => {
    e.preventDefault()
    searchQuery(searchValue)
    .then(response => {
      resultHandler(response.data)
      history.push('/results')
    })
  }

  return (
    <div className={classes.userSearch}>
      <p> Search our inventory of food, clothing, and many other items:</p>
      <form onSubmit={handleSearch} className={classes.userSearch}>
        <TextField className={classes.userSearchBar} value={searchValue} onChange={(event) => setSearchValue(event.target.value)}
        label= 'What are you looking for today?'
        type='search' variant='outlined'/>
        <Button className={classes.searchButton} variant="contained" color="primary"
        type="submit">Search</Button>
      </form>

    </div>
  )
}

export default SearchForm
