# docker build . -t ghcr.io/justm4d/kobra-framebuffer-vnc:latest
# docker push ghcr.io/justm4d/kobra-framebuffer-vnc:latest


FROM ghcr.io/jbatonnet/rinkhals/buildroot:latest

RUN apt update && apt install -y cmake libvncserver-dev 
##libvncserver1

ADD ./libvncserver /libworkdir/
COPY ./CMakeLists_libvncserver.txt /libworkdir/CMakeLists.txt
WORKDIR /libworkdir

RUN mkdir -p build
WORKDIR /libworkdir/build
RUN cmake ..
RUN make install

#---

ADD ./framebuffer-vncserver /workdir/
COPY ./CMakeLists_framebuffer-vncserver.txt /workdir/CMakeLists.txt
WORKDIR /workdir

RUN mkdir -p build
WORKDIR /workdir/build
RUN cmake ..
RUN make
