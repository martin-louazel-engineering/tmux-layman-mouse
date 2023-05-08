#!/usr/bin/env bash

set -e

# Forwarding wheel event to alternate screens (less/man/htop/etc...)
# ====================
tmux bind -T root WheelUpPane \
	"if-shell -Ft= '#{?mouse_any_flag,1,#{pane_in_mode}}' \
		'send -Mt=' \
		'if-shell -t= \"#{?alternate_on,true,false}\" \
			\"send -t= Up Up\" \"copy-mode -et=\"'"

tmux bind -T root WheelDownPane \
	"if-shell -Ft = '#{?pane_in_mode,1,#{mouse_any_flag}}' \
		'send -Mt=' \
		'if-shell -t= \"#{?alternate_on,true,false}\" \
			\"send -t= Down Down\" \"send -Mt=\"'"


# Mouse events
# ====================

# Middle-click paste
tmux bind -T root MouseDown2Pane \
	"run \"xclip -o | tmux load-buffer - ; tmux paste-buffer\""
tmux bind -T copy-mode MouseDown2Pane \
	"send-keys -X cancel ;\
	run \"xclip -o | tmux load-buffer - ; tmux paste-buffer\""
tmux bind -T copy-mode-vi MouseDown2Pane \
	"send-keys -X cancel ;\
	run \"xclip -o | tmux load-buffer - ; tmux paste-buffer\""

# Drag select
tmux bind -T copy-mode MouseDragEnd1Pane \
	"copy-mode -M ;\
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary -r\""
tmux bind -T copy-mode-vi MouseDragEnd1Pane \
	"copy-mode -M ;\
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary -r\""

# Double click: select word
tmux bind -T copy-mode DoubleClick1Pane \
	"select-pane ; \
	send-keys -X select-word ; \
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary\""
tmux bind -T copy-mode-vi DoubleClick1Pane \
	"select-pane ; \
	send-keys -X select-word ; \
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary\""
tmux bind -n DoubleClick1Pane \
	"select-pane ; \
	copy-mode -M ; \
	send-keys -X select-word ; \
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary\""

# Triple click: select line
tmux bind -T copy-mode TripleClick1Pane \
	"select-pane ; \
	send-keys -X select-line ; \
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary\""
tmux bind -T copy-mode-vi TripleClick1Pane \
	"select-pane ; \
	send-keys -X select-line ; \
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary\""
tmux bind -n TripleClick1Pane \
	"select-pane ; \
	copy-mode -M ; \
	send-keys -X select-line ; \
	send-keys -X copy-pipe-no-clear \"xclip -in -sel primary\""

tmux bind -T copy-mode C-c \
	"send-keys -X copy-pipe-no-clear \"xclip -in -sel clipboard -r\" ;\
	send-keys -X cancel"
tmux bind -T copy-mode-vi C-c \
	"send-keys -X copy-pipe-no-clear \"xclip -in -sel clipboard -r\" ;\
	send-keys -X cancel"
