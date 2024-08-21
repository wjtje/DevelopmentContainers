FROM fedora:40

COPY \
    script/00-setup.sh \
    script/01-common.sh \
    script/01-git.sh \
    script/01-zsh.sh \
    script/10-nvm.sh /setup/

RUN /setup/00-setup.sh
ENTRYPOINT [ "zsh" ]
