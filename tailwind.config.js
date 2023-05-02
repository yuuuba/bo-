module.exports = {
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#97ed80",
          "secondary": "#dd836c",
          "accent": "#efb5fc",
          "neutral": "#282531",
          "base-100": "#FAF9FB",
          "info": "#83A8F6",
          "success": "#47D17E",
          "warning": "#F4CD4E",
          "error": "#FB4655",
        },
      },
    ],
  },
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require("daisyui"),
    require('@tailwindcss/typography')
  ],
}
