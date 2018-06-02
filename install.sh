set -ux

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# fish
# mkdir -p ~/.config/fish/functions
ln -s ${SCRIPT_DIR}/fish_prompt.fish ~/.config/fish/functions 
ln -s ${SCRIPT_DIR}/informative_git_prompt/__informative_git_prompt.fish ~/.config/fish/functions 

# git
ln -s ${SCRIPT_DIR}/.gitconfig ~/.gitconfig 

# bash

echo "-------my setting--------" >> ~/.bashrc
echo "export $SCRIPT_DIR/.bashrc" >> ~/.bashrc
