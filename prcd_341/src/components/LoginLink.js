import React from 'react'
import {Link} from 'react-router-dom'
import {makeStyles} from '@material-ui/styles'

const loginStyles = makeStyles({
  loginText: {
    fontSize: 'smaller',
    marginTop: 50,
  },
})

const LoginLink = () => {
  const loginClasses = loginStyles()
  return (
    <div className={loginClasses.loginText}>
      <p> Admin member? <Link to='/login' style={{color:'white'}}> Login here </Link> </p>
    </div>
  )
}

export default LoginLink
