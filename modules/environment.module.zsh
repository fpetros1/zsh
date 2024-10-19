[[ -f "$ENV_FILE" ]] &&\
	source "$ENV_FILE"

if [[ ! -f "$RC_FOLDER/.git.lock" ]]; then
   "$RC_FOLDER/git.sh"
   touch "$RC_FOLDER/.git.lock"
fi
