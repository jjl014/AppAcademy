import React from 'react';
import GreetingContainer from './greeting_container';
import SessionFormContainer from './session_form_container';
import { Route, Link } from 'react-router-dom';
import { AuthRoute } from '../util/route_util';
import SearchContainer from './search_container';
import BenchFormContainer from './bench_form_container';

const App = () => {
  return (
    <div>
      <header>
        <Link to='/'>
          <h1>Bench BnB</h1>
        </Link>
        <GreetingContainer />
      </header>
      <AuthRoute path='/login' component={SessionFormContainer}></AuthRoute>
      <AuthRoute path='/signup' component={SessionFormContainer}></AuthRoute>
      <Route exact path='/' component={SearchContainer}></Route>
      <Route path='/benches/new' component={BenchFormContainer}></Route>
    </div>
  );
};

export default App;
