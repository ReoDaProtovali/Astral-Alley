/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

const webpack = require('webpack');
const path = require('path');
const ExtractCssPlugin = require('mini-css-extract-plugin');

const createStats = (verbose) => ({
  assets: verbose,
  builtAt: verbose,
  cached: false,
  children: false,
  chunks: false,
  colors: true,
  entrypoints: true,
  hash: false,
  modules: false,
  performance: false,
  timings: verbose,
  version: verbose,
});

module.exports = (env = {}, argv) => {
  const mode = argv.mode || 'production';
  const config = {
    mode: mode === 'production' ? 'production' : 'development',
    context: path.resolve(__dirname),
    target: ['web', 'browserslist:last 2 Edge versions'],
    entry: {
      tgui: ['./packages/tgui-polyfill', './packages/tgui'],
      'tgui-panel': ['./packages/tgui-polyfill', './packages/tgui-panel'],
      'tgui-say': ['./packages/tgui-polyfill', './packages/tgui-say'],
    },
    output: {
      path: argv.useTmpFolder
        ? path.resolve(__dirname, './public/.tmp')
        : path.resolve(__dirname, './public'),
      filename: '[name].bundle.js',
      chunkFilename: '[name].bundle.js',
      chunkLoadTimeout: 15000,
      publicPath: '/',
    },
    resolve: {
      extensions: ['.tsx', '.ts', '.js', '.jsx'],
      alias: {},
    },
    module: {
      rules: [
        {
          test: /\.([tj]s(x)?|cjs)$/,
          exclude: /node_modules[\\/]core-js/,
          use: [
            {
              loader: require.resolve('swc-loader'),
            },
          ],
        },
        {
          test: /\.(s)?css$/,
          use: [
            ExtractCssPlugin.loader,
            require.resolve('css-loader'),
            require.resolve('sass-loader'),
          ],
        },

        {
          test: /\.(png|jpg|svg)$/,
          use: [
            {
              loader: require.resolve('url-loader'),
              options: {
                esModule: false,
              },
            },
          ],
        },
      ],
    },
    optimization: {
      emitOnErrors: false,
    },
    performance: {
      hints: false,
    },
    devtool: false,
    cache: {
      type: 'filesystem',
      cacheLocation: path.resolve(__dirname, `.yarn/webpack/${mode}`),
      buildDependencies: {
        config: [__filename],
      },
    },
    stats: createStats(true),
    plugins: [
      new webpack.EnvironmentPlugin({
        NODE_ENV: mode,
      }),
      new ExtractCssPlugin({
        filename: '[name].bundle.css',
        chunkFilename: '[name].bundle.css',
      }),
    ],
  };

<<<<<<< HEAD
  if (bench) {
    config.entry = {
      'tgui-bench': [
        './packages/tgui-polyfill',
        './packages/tgui-bench/entrypoint',
      ],
    };
  }

  // Development build specific options
  if (mode !== 'production') {
    config.devtool = 'cheap-module-source-map';
  }

  // Development server specific options
  if (argv.devServer) {
=======
  // Production build specific options
  if (mode === 'production') {
    const { EsbuildPlugin } = require('esbuild-loader');
    config.optimization.minimizer = [
      new EsbuildPlugin({
        css: true,
        legalComments: 'none',
      }),
    ];
  } else {
>>>>>>> 8a4f06eed4 ([MIRROR] removes tgui sonar, dev server oversights (#11129))
    config.devServer = {
      clientLogLevel: 'silent',
      hot: true,
      noInfo: false,
      progress: false,
      quiet: false,
      stats: createStats(false),
    };
    config.devtool = 'cheap-module-source-map';
  }

  return config;
};
