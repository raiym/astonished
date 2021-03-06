FROM ubuntu:18.04
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install git && \
    apt-get -y install cmake && \
    apt-get -y install libssl-dev && \
    apt-get -y install g++ && \
    apt-get -y install zlib1g-dev && \
    apt-get -y install wget && \
    apt-get -y install python3 && \
    apt-get -y install python3-pip
RUN git clone https://github.com/ton-blockchain/ton/ && \
    cd ./ton  && \
    git submodule update --init --recursive && \
    cd .. && \
    mkdir liteclient-build && \
    cd liteclient-build && \
    cmake ../ton -DCMAKE_BUILD_TYPE=Release && \
    cmake --build . --target lite-client && \
    cmake --build . --target fift && \
    cmake --build . --target func && \
    wget https://test.ton.org/ton-lite-client-test1.config.json
EXPOSE 8080
RUN pip3 install web.py==0.40
COPY . /astonished
WORKDIR /astonished
CMD python3 main.py 8080 "/liteclient-build/lite-client/lite-client -C /liteclient-build/ton-lite-client-test1.config.json" "/liteclient-build/crypto/fift -I/ton/crypto/fift/lib/ -i" "0QAESRAUnb6vjq27KyhyLn1qLcbiZOwvHZvr1vsgkHm8Ksyd"
