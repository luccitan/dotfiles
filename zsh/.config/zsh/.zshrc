source $HOME/.config/zsh/.commons.zshrc
source $HOME/.config/zsh/.plugins.zshrc

OS_UNAME="$(uname -s)"
case "${OS_UNAME}" in

    Linux*)
        source $HOME/.config/zsh/.linux.zshrc
    ;;

    Darwin*)
        source $HOME/.config/zsh/.darwin.zshrc
    ;;
esac
