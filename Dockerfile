FROM registry.access.redhat.com/ubi8/nodejs-14
USER root

# remove nodejs-nodemon vulnerability
RUN dnf remove -y nodejs-nodemon

# Add application sources
ADD . /opt/app-root

# Install the dependencies
RUN cd /opt/app-root && npm install

# Setup cloud services
RUN cd / && git clone https://github.com/RedHatInsights/cloud-services-config.git

# Run script uses standard ways to run the application
CMD cd /cloud-services-config; npx http-server -p 8889
#CMD BETA=true npm run start:proxy
