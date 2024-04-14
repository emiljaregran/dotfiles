
## Tmux plugin manager
$ git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

## Enable copying to the system clipboard
$ sudo apt install xsel 
In tmux: `prefix`–I to install tmux-yank

### Key bindings
 - Normal mode
   -- `prefix`-y: Copy text from the command line.
   -- `prefix`-Y: Copy the current working directory path.

 - Copy mode
   -- `y`: Copy selection to system clipboard.
   -- `Y`: Copy selection and paste it to the command line.
