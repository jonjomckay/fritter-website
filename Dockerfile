FROM docker.io/timbru31/ruby-node:3.0 AS build

ENV NODE_ENV   production
ENV JEKYLL_ENV production

# Don't modify the Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile      .
COPY Gemfile.lock .
RUN  bundle install

ADD . .
RUN yarn install && jekyll build --trace

FROM docker.io/nginx:1.20.0-alpine
COPY --from=build /usr/src/app/_site /usr/share/nginx/html
