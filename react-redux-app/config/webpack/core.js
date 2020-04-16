import path from 'path';
import flowRight from 'lodash.flowright';
import webpack from 'webpack';
import loader from 'webpack-partial/loader';
import plugin from 'webpack-partial/plugin';
import * as partials from './partials';
import CaseSensitivePathsPlugin from 'case-sensitive-paths-webpack-plugin';
import { CleanWebpackPlugin as Clean } from 'clean-webpack-plugin';
import HtmlWebpackPlugin from 'html-webpack-plugin';

export default function coreConfig(options) {
  return flowRight(
    partials.mode('development'),
    partials.entry({ main: ['regenerator-runtime', options.entry] }),
    partials.context(options.context),
    partials.output({
      path: options.outputPath,
      publicPath: '/',
      chunkFilename: `${options.outputFilename}.chunk.js`,
      filename: `${options.outputFilename}.bundle.js`,
    }),
    loader({
      test: /\.js|\.jsx$/,
      exclude: /(node_modules)/,
      use: [
        {
          loader: 'babel-loader',
        }
      ],
    }),
    plugin(new CaseSensitivePathsPlugin()),
    plugin(
      new Clean({
        root: path.dirname(path.dirname(options.outputPath)),
        verbose: true,
      }),
    ),
    plugin(
      new HtmlWebpackPlugin({
        template: './src/src/index.html',
      }),
    ),
  );
}
