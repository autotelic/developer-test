import webpack from 'webpack'; // eslint-disable-line
import plugin from 'webpack-partial/plugin'; // eslint-disable-line
import flowRight from 'lodash.flowright';

export default flowRight(plugin(new webpack.DefinePlugin({
  DEBUG: true,
})));
