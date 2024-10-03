if ! tmux has-session -t notes 2>/dev/null; then
	tmux new-session -d -s notes
fi

if [ -z "$TMUX" ]; then
	tmux attach-session -t notes
else
	tmux switch-client -t notes
fi
