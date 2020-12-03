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
import VolunteerShifts from './components/VolunteerShifts'
import VolunteerForm from './components/VolunteerForm'
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
    },
  },
})

const App = () => {
  const classes = useStyles()
  const [searchResults, setSearchResults] = useState({
    inventory: [],
    food: [],
    recipes: []
  })
  const [shifts, setShifts] = useState([])


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
            <VolunteerShifts resultHandler={setShifts}/>
          </div>
        </Route>
        <Route path='/results'>
          <SearchForm resultHandler={setSearchResults}/>
          <p style={{textAlign: 'center'}}>See something you like?
            <a href='https://community.case.edu/prc/home/' target="_blank" rel="noopener noreferrer" style={{color: 'white'}}> Book a time slot on CampusGroups </a>
             to come pick it up!
          </p>
          <DisplayResults results={searchResults} />
        </Route>
        <Route path='/signup'>
          <VolunteerForm shifts={shifts} />
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
