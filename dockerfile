FROM ubuntu
RUN apt-get update
RUN apt-get install genisoimage -y
COPY sp1.sh sp1.sh
RUN chmod ugo+x /sp1.sh
CMD ./sp1.sh

