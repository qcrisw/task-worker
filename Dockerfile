FROM python:3.6.5
LABEL maintainer="Khalid Peer <khalid.peer233@gmail.com>"

WORKDIR /home

# copy requirements first to cache the deps
COPY requirements.txt /home
RUN pip3 install -r requirements.txt

# copy bash script to spin up RQ workers
COPY start_worker /home

# copy rest of source code to container
COPY / /home

# start up RQ workers 
ENTRYPOINT ["/bin/bash", "start_worker"]