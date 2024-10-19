[[ -f "$ENV_FILE" ]] &&\
	source "$ENV_FILE"

if [[ ! -f "$SCRIPT_FOLDER/.git.lock" ]]; then
   "$SCRIPT_FOLDER/git.sh"
   touch "$SCRIPT_FOLDER/.git.lock"
fi
