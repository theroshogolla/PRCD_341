import React, {useState} from 'react'
import {TextField, Button} from '@material-ui/core'
import {makeStyles} from '@material-ui/styles'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  Redirect
} from "react-router-dom"

import SearchForm from './components/SearchForm'
import AdminLogin from './components/AdminLogin'

const useStyles = makeStyles({
  root: {
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'column',
  },
})

const App = () => {
  const classes = useStyles()

  return (
    <Router>
      <div className={classes.root}>
        <h1>CWRU Physical Resource Center Database</h1>

      </div>

      <Switch>
        <Route path='/search'>
          <SearchForm />
        </Route>
        <Route path='/login'>
          <AdminLogin />
        </Route>
        <Route path= '/'>
          <Redirect to='/search' />
        </Route>

      </Switch>
    </Router>
    );
}

export default App;
