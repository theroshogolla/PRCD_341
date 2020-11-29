import React, {useState} from 'react'
import {TextField, Button} from '@material-ui/core'
import {makeStyles} from '@material-ui/styles'
import {Link} from 'react-router-dom'

import VolunteerShifts from './VolunteerShifts'

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
    height: 50
  },
  searchButton: {
    width: 100,
    height: 50,
    marginTop: 30
  },

})

const loginStyles = makeStyles({
  loginText: {
    fontSize: 'smaller',
    marginTop: 50
  },
})

const LoginLink = () => {
  const loginClasses = loginStyles()
  return (
    <div className={loginClasses.loginText}>
      <p> Admin member? <Link to='/login'> Login here </Link> </p>
    </div>
  )
}



const SearchForm = () => {
  const classes = useStyles()
  const [searchValue, setSearchValue] = useState('')
  return (
    <div className={classes.userSearch}>
      <h2>Welcome to the PRC Database!</h2>
      <p> Search our inventory of food, clothing, and many other items:</p>
      <form className={classes.userSearch} noValidate autoComplete='off'>
        <TextField className={classes.userSearchBar} value={searchValue} onChange={(event) => setSearchValue(event.target.value)}
        label= 'What are you looking for today?'
        type='search' variant='outlined'/>
        <Button className={classes.searchButton} variant="contained" color="primary" type="submit">Search</Button>
      </form>

      <VolunteerShifts />
      <LoginLink />

    </div>
  )
}

export default SearchForm
