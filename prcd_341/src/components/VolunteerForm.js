import React, {useState} from 'react'
import {Button, TextField, MenuItem} from '@material-ui/core'
import {makeStyles, withStyles} from '@material-ui/styles'

import {sendSignUp} from '../services/serverApi'
import history from '../services/history'

const useStyles = makeStyles({
  root:{
    display:'flex',
    flexDirection: 'column',
    alignItems: 'center'
  },
  volunteerForm: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center'
  },
  textInput: {
    marginTop: 20,
    width: 300,
    height: 50,
    '& input:valid:focus + fieldset': {
      borderColor: 'white',
    },
    '& input:invalid:focus + fieldset': {
      borderColor: 'white',
    },
  },
  formSelect: {
    marginTop: 20,
    width: 300,
    height: 50,
  },
  submitButton: {
    marginTop: 20,
  }
})



const VolunteerForm = ({shifts}) => {
  const classes = useStyles()

  const [caseID, setCaseID] = useState('')
  const [name, setName] = useState('')
  const [cell, setCell] = useState('')
  const [email, setEmail] = useState('')
  const [type, setType] = useState('')
  const [shiftTime, setShiftTime] = useState('')

  const shiftDate = new Date (shifts[0].shift_time)

  const submitSignUp = (e) => {
    e.preventDefault()
    sendSignUp(caseID, name, cell, email, type, shiftTime)
    .then(response => {
      console.log(response)
      history.push('/')
    })
  }

  return(
    <div className={classes.root}>
      <h3>Sign up for a shift on {`${shiftDate.getMonth()+1}/${shiftDate.getDate()}/${shiftDate.getFullYear()}:`}</h3>
      <form className={classes.volunteerForm} autoComplete='off' onSubmit={submitSignUp}>
        <TextField className={classes.textInput} required label='Case ID' variant='outlined'
          value={caseID} onChange={(event) => setCaseID(event.target.value)} />

        <TextField className={classes.textInput} required label='Name' variant='outlined'
          value={name} onChange={(event) => setName(event.target.value)} />

        <TextField className={classes.textInput} label='Cell(non-hyphenated)' variant='outlined'
          value={cell} onChange={(event) => setCell(Number(event.target.value))} />

        <TextField className={classes.textInput} label='Email' variant='outlined'
          value={email} onChange={(event) => setEmail(event.target.value)} />

        <TextField required className={classes.formSelect} select label='Type' variant='outlined'
          value={type} onChange={(event) => setType(event.target.value)}>
            <MenuItem value='FLEX'> Flexible </MenuItem>
            <MenuItem value='LONG'> Long Term </MenuItem>
        </TextField>

        <TextField required className={classes.formSelect} select label='Shift Time' variant='outlined'
          value={shiftTime} onChange={(event) => setShiftTime(event.target.value)}>
          {shifts.map(({shift_time}) => {
            const shift = new Date(shift_time)
            return(
              <MenuItem key={shift_time} value={shift_time}>
                {`${shift.getHours()}:${shift.getMinutes()}`}
              </MenuItem>
            )
          })}
          </TextField>

        <Button className={classes.submitButton} type='submit' variant='contained' color='primary'>Submit</Button>
      </form>
    </div>
  )
}

export default VolunteerForm
