RC_FOLDER=$(dirname $(readlink -f ~/.zshrc))

main() {
    load_module "variables"
    load_module "options"
    load_module "functions"
    load_module "plugins"
    load_module "environment"
    load_module "colors"
    load_module "prompt"
}

load_module() {
    source "${RC_FOLDER}/modules/${1}.module.zsh"
}

main
