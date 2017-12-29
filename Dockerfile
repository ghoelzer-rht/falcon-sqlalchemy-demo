# Initial Development, Testing Steps
# 1. Started with base CentOS Image
# 2. Added Git, EPEL, and Python Dev Libraries
#   yum install git, epel-release
#   yum install python-pip python-devel gcc nginx
# 3. Created /opt/app subdir, then cloned this repo there
#
# As an alternative, could also look at using CentOS Stand-Alone S2I Image - https://hub.docker.com/r/centos/python-34-centos7/
# Also looking at base python image
#
# Was able to git clone project into /opt and startup app with /run_dev_server.sh command.  
# Will build Dockefile from this base and create separate user/group for security purposes exposing port 8080
#
# Latest official python image from Docker Hub
FROM  python:latest
LABEL author="Greg Hoelzer <Greg.Hoelzer@microsoft.com>" \
      io.k8s.description="Demo Python/Falcon REST API with sqlite" \
      io.k8s.display-name="falcon-sqlalchmey-demo" \
      io.k8s.expose-services="8080:http" \
      io.k8s.tags="demo,python,falcon,sqlite"
# Clone project onto image
RUN mkdir -p /opt/falcon-sqlalchemy-demo && mkdir /env && \ 
    git clone https://github.com/ghoelzer-rht/falcon-sqlalchemy-demo.git /opt/falcon-sqlalchemy-demo
# Additional Base Python Packages required
RUN pip install virtualenv
# Set App Root for Startup Scripts
ENV APP_ROOT="/opt/falcon-sqlalchemy-demo"
# Run code with default, Non-Root User
RUN chown -R 1001:1001 /opt/falcon-sqlalchemy-demo && chown -R 1001:1001 /env
# Add Python & System Libraries to Root Group
RUN chgrp -R 0 /usr/local 
RUN chmod -R g+rw /usr/local 
RUN find /usr/local -type d -exec chmod g+x {} + 
USER 1001
# Expose API Endpoint
EXPOSE 8080
# Start Falcon/Python Http Server & Application
ENTRYPOINT /opt/falcon-sqlalchemy-demo/run_dev_server.sh


