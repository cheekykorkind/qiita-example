#!/bin/sh

sudo chown ${UID}:${GID} -R /home/${UNAME}

# Alpine Linux image doesn't contain bin/bash
/bin/sh