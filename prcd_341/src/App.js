import React, {useState} from 'react'
import {createMuiTheme, ThemeProvider} from '@material-ui/core/styles'
import {makeStyles} from '@material-ui/styles'
import {
  Router,
  Switch,
  Route,
  Redirect
} from "react-router-dom"

import SearchForm from './components/SearchForm'
import DisplayResults from './components/DisplayResults'
import AdminLogin from './components/AdminLogin'
import LoginLink from './components/LoginLink'
import VolunteerShifts from './components/VolunteerShifts'
import history from './services/history'

const useStyles = makeStyles({
  root: {
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
  },
})

const theme = createMuiTheme({
  palette: {
    type: 'dark',
  },
  overrides: {
    MuiFormLabel: {
      root: {
        "&$focused": {
          color: 'white',
        }
      },

      focused: {}
    }
  }
})

const App = () => {
  const classes = useStyles()
  const [searchResults, setSearchResults] = useState({
    inventory: [],
    food: [],
    recipes: []
  })

  return (
    <Router history={history}>
      <ThemeProvider theme={theme}>
      <div style={{textAlign: 'center'}}>
        <h1>Welcome to the CWRU Physical Resource Center Database!</h1>
      </div>

      <Switch>
        <Route path='/search'>
          <div className={classes.root}>
            <SearchForm resultHandler={setSearchResults}/>
            <VolunteerShifts />
            <LoginLink />
          </div>
        </Route>
        <Route path='/login'>
          <AdminLogin />
        </Route>
        <Route path='/results'>
          <SearchForm resultHandler={setSearchResults}/>
          <DisplayResults results={searchResults} />
        </Route>
        <Route path= '/'>
          <Redirect to='/search' />
        </Route>

      </Switch>
      </ThemeProvider>
    </Router>
    );
}

export default App;
