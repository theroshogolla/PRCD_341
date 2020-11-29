import React, {useState} from 'react'
import {TextField, Button} from '@material-ui/core'
import {makeStyles} from '@material-ui/styles'
import {getShifts} from '../services/serverApi'

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
  const [shiftDate, setShiftDate] = useState('')
  const [shifts, setShifts] = useState([])

  const requestShifts = (e) => {
    e.preventDefault()
    getShifts(shiftDate)
    .then(response => {
      setShifts([response.data])
    })
  }

  return (
    <div className={classes.root}>
      <p>Interested in volunteering at the PRC? Select a date below to view available shifts!</p>
      <form onSubmit={requestShifts}>
        <TextField type='date' onChange={(event) => setShiftDate(event.target.value)} value={shiftDate}  />
        <Button type="submit">Confirm</Button>
      </form>
    </div>
  )
}

export default VolunteerShifts
