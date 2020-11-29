import React from 'react'
import {makeStyles} from '@material-ui/styles'

const useStyles = makeStyles({
  root: {
    marginLeft: 30,
  },
})

const Result = ({name, quantity, vendor}) => {
  return(
    <>
      <h4>{name}</h4>
      <p><strong>Vendor:</strong> {vendor}</p>
      <p><strong>{quantity} items in stock.</strong></p>
    </>
  )
}



const DisplayResults = ({results}) => {
  const classes = useStyles()

  return(
    <div className={classes.root}>
      <h2>Inventory</h2>
      <ol>
      {results.inventory.map(
        ({type, qty, vendor}) => <li key={`${type}${vendor}`}><Result name={type} quantity={qty} vendor={vendor} /></li>
      )}
      </ol>
      <br/>
      <h2>Food</h2>
      <ol>
      {results.food.map(
        ({category, vendor, qty, accommodations}) => {
          return(
            <li key={`${category}${vendor}`}>
              <Result name={category} quantity={qty} vendor={vendor} />
              <p><strong>Accommodations:</strong> {accommodations}</p>
            </li>
          )
      })}
      </ol>
      <h2>Recipes</h2>
      <ol>
      {results.recipes.map(({name, webLink}) => {
        return(
          <li key={`${webLink}`}>
            <h4>{name}</h4>
            <p><strong>Link: </strong><a href={webLink}>{webLink}</a></p>
          </li>
        )
      })}
      </ol>
    </div>
  )
}

export default DisplayResults
