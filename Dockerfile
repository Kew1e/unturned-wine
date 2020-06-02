ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl screen htop unzip lib32stdc++6 mono-runtime mono-devel libc6 libgl1-mesa-glx libxcursor1 libxrandr2 libc6-dev wine-stable wine libgcc-8-dev && \
    useradd -d /home/container -m container

ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
WORKDIR /
CMD ["/bin/bash", "./entrypoint.sh"]
