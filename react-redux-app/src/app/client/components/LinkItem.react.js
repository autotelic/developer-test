import React from 'react';
import Link from 'found/lib/Link';

const LinkItem = (props) => {
  return (
    <li>
      <Link
        {...props}
        activeStyle={
          { fontWeight: 'bold' }
        }
      />
    </li>
  );
}

LinkItem.defaultProps = {
  activeStyle: {
    fontWeight: 'bold',
  },
};

export default LinkItem;
