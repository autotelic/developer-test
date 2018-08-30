import React from 'react';

import App from './client/components/App.react';

const Foo = ({ props }) => (
  <div>foo</div>
);

export default [
  {
    path: '/',
    Component: App,
    children: [
      {
        Component: () => <div>Main</div>,
      },
      {
        path: 'foo',
        getComponent: Foo,
      },
    ],
  },
];
