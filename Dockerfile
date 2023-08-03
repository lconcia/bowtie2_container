# Use a base image with the desired OS and dependencies
FROM ubuntu:20.04

# Set the working directory inside the container
WORKDIR /app

# Update the package index and install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget build-essential unzip locales

# Download Bowtie2 version 2.4.4 from the official source
RUN wget https://github.com/BenLangmead/bowtie2/releases/download/v2.4.4/bowtie2-2.4.4-linux-x86_64.zip && \
    unzip bowtie2-2.4.4-linux-x86_64.zip && \
    rm bowtie2-2.4.4-linux-x86_64.zip

# Add Bowtie2 binaries to the PATH environment variable
ENV PATH="/app/bowtie2-2.4.4-linux-x86_64:${PATH}"

# enviroment variables 
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the entrypoint for the container (you can modify this based on your needs)
ENTRYPOINT ["bowtie2"]
