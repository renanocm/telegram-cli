FROM ubuntu:latest

RUN apt-get update && apt-get install -y \ 
luajit \
luarocks \
libreadline-dev \
libconfig-dev \
libssl-dev \
lua5.2 \
liblua5.2-dev \
libevent-dev \
libjansson-dev \
libpython-dev \
wget \
make \
git \
python \
python-pip

RUN pip install --upgrade pip && \
pip install requests && \
pip install schedule

RUN git clone --recursive https://github.com/vysheng/tg.git /tg && \
cd /tg && \
./configure && \
cd /tg && \
make && \
mv -v /tg/bin/* /usr/bin/ && \
mkdir -vp /etc/telegram-cli/ && \
mv -v /tg/tg-server.pub /etc/telegram-cli/server.pub && \
rm -rf /tg/

ENTRYPOINT /usr/bin/telegram-cli
