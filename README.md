# tmux-layman-mouse

A Tmux plugin that makes your tmux environment manageable to the layman using their mouse !

## Motivation

Tmux is great, I use it all the time ! But let's be honest, out of the box, the mouse support is absolutely horrendous.
This is a shame for 2 reasons:

1.  Not everyone uses tmux. And if you have to do stuff on your PC with a "layman" (understand: someone that doesn't spend their entire life in tmux) when eg doing pair programming, it's usually very painful to accomplish the simplest action (highlighting text, moving around). So you end up either doing everything yourself, or doing a tmux crash course in 30 seconds. I think that gets in the way of collaboration and team-work, which is a shame...
2.  Even though we might be used to navigating within tmux using keybindings, sometimes we fallback on wanting to use the mouse for whatever reason. In that case, tmux pretty much gets in the way of that. I've seen people ditch tmux for that reason alone, which is a shame...

This plugin is an attempt for a solution: a plugin working out of the box for everybody to use tmux with their mouse.

## Features

- Keep highlighting text after selection
- Double-click to select word
- Triple-click to select line
- Linux-like middle-click pasting of selection
- Ctrl-C copy of selected text
- Scrolling through alternate screens (less, man pages, etc..) instead of entering copy-mode

## Requirements

This plugin requires 2 things:

1.  Setting the mouse on in you `.tmux.conf`. Duh...

	```tmux
	set -g mouse on
	```

2.  Having `xclip` installed on your system

## Installing

### Via TPM (recommended)

The easiest way to install this plugin is via the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

1.  Add plugin to the list of TPM plugins in `.tmux.conf`:

	``` tmux
	set -g @plugin 'martin-louazel-engineering/tmux-layman-mouse'
	```

### Manual Installation

1.  Clone the repository.  Change the destination path ~/clone/path to wherever you would like.

	``` sh
	$ git clone https://github.com/martin-louazel-engineering/tmux-layman-mouse ~/path/of/your/choice
	```

2.  Add this line to the bottom of `.tmux.conf`.

	``` tmux
	run-shell ~/path/of/your/choice/layman_mouse.tmux
	```

## Notes

There are a lot of other tmux plugins that touch on this subject, like `tmux-paste`, `tmux-mighty-scroll` or `tmux-better-mouse-mode` to name a few.
Those plugins are great, you should check them out! However, I found that all of them handle only part of the issue when it comes to mouse support.
I find it better to have a single repository of configuration that handles every aspect of it and works out of the box. But whatever floats your boat!
