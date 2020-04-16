import React from 'react';
import LinkItem from './LinkItem.react';

function App(props) {
  return (
    <div>
      <h1>Autotelic</h1>
      <ul>
        <LinkItem to="/">Main</LinkItem>
        <LinkItem to="/foo">foo</LinkItem>
      </ul>
      {props.children}
    </div>
  );
}

export default App;
