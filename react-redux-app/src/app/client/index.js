import FarceActions from 'farce/Actions';
import BrowserProtocol from 'farce/BrowserProtocol';
import createHistoryEnhancer from 'farce/createHistoryEnhancer';
import queryMiddleware from 'farce/queryMiddleware';
import createConnectedRouter from 'found/createConnectedRouter';
import createMatchEnhancer from 'found/createMatchEnhancer';
import createRender from 'found/createRender';
import foundReducer from 'found/foundReducer';
import Matcher from 'found/Matcher';
import resolver from 'found/resolver';
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { combineReducers, compose, createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';

import routeConfig from '../routeConfig';

const store = createStore(
  combineReducers({
    found: foundReducer,
  }),
  compose(
    createHistoryEnhancer({
      protocol: new BrowserProtocol(),
      middlewares: [queryMiddleware],
    }),
    createMatchEnhancer(new Matcher(routeConfig)),
    applyMiddleware(logger),
  ),
);

store.dispatch(FarceActions.init());

const ConnectedRouter = createConnectedRouter({
  render: createRender({
    renderError: ({ error }) => (
      <div>{error.status === 404 ? 'Not found' : 'Error'}</div>
    ),
  }),
});

ReactDOM.render(
  <Provider store={store}>
    <ConnectedRouter resolver={resolver} matchContext={{ store }} />
  </Provider>,
  document.getElementById('root'),
);
