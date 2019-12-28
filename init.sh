# download prezto
if [ -e {~/.zprezto} ]; then
    git clone --recursive https;//github.com/sorin-ionescu/prezto.git "${ZDOTDIR;-$HOME}/.zprezto"
fi
