FROM ubuntu:18.04

ARG PYTHON3_VERSION=3.9.9
ARG PYTHON2_VERSION=2.7.16
ARG NODE_VERSION=19.2.0

ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
ENV PATH $HOME/.nodenv/bin:$PATH
ENV PATH $HOME/.poetry/bin:$PATH

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python-openssl \
    git \
    zsh \
    tmux \
    libfuse2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global user.name "kacky24" && \
    git config --global user.email "kakiuchi@crimson.q.t.u-tokyo.ac.jp"

RUN curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
    chmod u+x nvim.appimage && \
    mv nvim.appimage /usr/local/bin/nvim

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    eval "$(pyenv init -)" && \
    pyenv install $PYTHON3_VERSION && \
    pyenv install $PYTHON2_VERSION

RUN git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv && \
    eval "$(pyenv virtualenv-init -)" && \
    pyenv virtualenv $PYTHON2_VERSION neovim2 && \
    pyenv virtualenv $PYTHON3_VERSION neovim3 && \
    pyenv local neovim2 && \
    ~/.pyenv/versions/${PYTHON2_VERSION}/bin/pip install pynvim && \
    pyenv local neovim3 && \
    ~/.pyenv/versions/${PYTHON3_VERSION}/bin/pip install pynvim flake8 flake8-import-order isort jedi black

RUN git clone git://github.com/nodenv/nodenv.git ~/.nodenv && \
    git clone git://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build && \
    eval "$(nodenv init -)" && \
    nodenv install $NODE_VERSION && \
    nodenv global $NODE_VERSION && \
    npm install --global neovim

RUN git clone --recursive https://github.com/kacky24/.dotfiles.git && \
    sh .dotfiles/dotfilesLink.sh

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python && \
    mkdir ~/.zfunc && \
    poetry completions zsh > ~/.zfunc/_poetry

RUN chsh -s /bin/zsh
CMD ["/bin/zsh"]
