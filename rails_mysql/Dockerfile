FROM --platform=linux/x86_64 node:16.6.1 AS yarn

FROM --platform=linux/x86_64 ruby:2.6.5
COPY --from=yarn /usr/local/bin/node /usr/local/bin/
COPY --from=yarn /opt/yarn-v1.22.5 /opt/yarn
RUN    ln -s /opt/yarn/bin/yarn    /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

RUN    apt update -qq \
    && apt install -y --no-install-recommends \
        build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && gem uninstall bundler \
    && gem install bundler -v 2.1.4

ENV app_path /myapp

RUN mkdir ${app_path}
WORKDIR   ${app_path}
COPY ./myapp/Gemfile      ${app_path}/Gemfile
COPY ./myapp/Gemfile.lock ${app_path}/Gemfile.lock
RUN bundle install \
    && rm ${app_path}/Gemfile \
    && rm ${app_path}/Gemfile.lock