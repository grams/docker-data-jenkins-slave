FROM ubuntu:12.10

# Create Jenkins user
RUN useradd -m -d /home/jenkins -u 18001 -p $(perl -e 'print crypt("jenkins", "jenkins"),"\n"') -s /bin/bash -U jenkins

# Expose volume
RUN mkdir -p /home/jenkins/slave/workspace
RUN chown -R jenkins:jenkins /home/jenkins/slave

VOLUME ["/home/jenkins/slave/workspace"]

CMD ["true"]
