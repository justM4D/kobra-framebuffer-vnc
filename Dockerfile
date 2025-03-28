# docker build . -t ghcr.io/justm4d/kobra-framebuffer-vnc:latest
# docker push ghcr.io/justm4d/kobra-framebuffer-vnc:latest


FROM ghcr.io/jbatonnet/rinkhals/buildroot:latest

RUN apt update && apt install -y libvncserver-dev cmake

ADD ./framebuffer-vncserver /workdir/
WORKDIR /workdir

RUN mkdir -p build
WORKDIR /workdir/build
RUN cmake -DBUILD_SHARED_LIBS=OFF ..
RUN make
