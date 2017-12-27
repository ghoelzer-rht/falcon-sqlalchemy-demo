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
