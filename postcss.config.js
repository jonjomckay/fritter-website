module.exports = {
    plugins: [
        require("autoprefixer"),
        require("tailwindcss"),
        ...(process.env.JEKYLL_ENV == "production" // example of only using a plugin in production
            ? [require("cssnano")({ preset: "default" })]
            : [])
    ]
};
