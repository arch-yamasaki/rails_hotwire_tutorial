FROM ruby:3.1
RUN apt update -qq && apt install -y postgresql-client ruby-dev vim npm \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ENV HOMEDIR "/app"
RUN mkdir ${HOMEDIR}
WORKDIR ${HOMEDIR}
ADD Gemfile ${HOMEDIR}/Gemfile
# ADD Gemfile.lock /${HOMEDIR}/Gemfile.lock
RUN bundle install

# COPY entrypoint.sh /usr/bin/entrypoint.sh
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
