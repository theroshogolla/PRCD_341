import React, {useState} from 'react'
import {TextField, Button} from '@material-ui/core'
import {makeStyles} from '@material-ui/styles'

const useStyles = makeStyles({
  root: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    marginTop: 30
  },
})

const VolunteerShifts = () => {
  const classes = useStyles()
  return (
    <div className={classes.root}>
      <p>Interested in volunteering at the PRC? Select a date below to view available shifts!</p>
      <form>
        <TextField type='date' defaultValue={new Date()} />
        <Button type="submit">Confirm</Button>
      </form>
    </div>
  )
}

export default VolunteerShifts
