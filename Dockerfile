FROM ubuntu:rolling

ARG USERNAME=ubuntu

ENV TZ=America/Denver
RUN echo "$TZ" > /etc/timezone

RUN DEBIAN_FRONTEND=noninteractive apt-get update &&\
    apt-get install -y -qq\
        apt-utils\
        ca-certificates\
        curl\
        dialog\
        git\
        ncurses-term\
        sudo\
        tzdata\
        wget\
        zsh\
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME\
    && rm -rf /var/lib/apt/lists/*

ENV TERM=xterm-256color
ENV PATH="/home/$USERNAME/bin:$PATH"

# Switch to non-root user
USER $USERNAME
WORKDIR /home/$USERNAME
