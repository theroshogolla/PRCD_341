import React, {useState} from 'react'
import {TextField, Button} from '@material-ui/core'

const AdminLogin = () => {
  const [caseId, setCaseId] = useState('')
  return (
    <div>
      <form>
        <TextField value={caseId} onChange={(event) => setCaseId(event.target.value)}
        label='Case ID' variant='outlined'/>
        <Button type='submit'>Login</Button>
      </form>
    </div>
  )
}

export default AdminLogin
