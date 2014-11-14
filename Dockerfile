FROM ubuntu:14.04

# Install required system packages
RUN apt-get update 

# Install Mono (done as a separate step to allow caching the other steps)
RUN apt-get install -yq mono-devel

# Creates a working directory for later things to build on

RUN mkdir /working
WORKDIR /working

# Adds Azure SDK for Python
COPY externals/azure-sdk-for-python/azure /working/azure

# Adds IronPython
COPY IronPython-2.7.4 /working/ipy

# Make mono trust basic SSL
RUN mozroots --import --ask-remove
