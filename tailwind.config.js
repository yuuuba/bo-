module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      // 色の設定を拡張
      colors: {
        accent: '#FFB600',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
