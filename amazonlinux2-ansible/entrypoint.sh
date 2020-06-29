#!/bin/bash

sudo chown ${UID}:${GID} -R /home/ec2-user

ls -al /home/ec2-user/.ssh

sudo chmod 600 -R /home/ec2-user/.ssh/authorized_keys
sudo chmod 600 -R /home/ec2-user/.ssh/docker-ssh-key
sudo chmod 600 -R /home/ec2-user/.ssh/docker-ssh-key.pub

ls -al /home/ec2-user/.ssh

/bin/bash