command-prompt -p session_path,session_name "attach-session -d -t . -c %1 ; rename-session %2 ; new-window -d -n nvim -c %1 ; new-window -d -n ssh -c %1 ; rename-window explorer ; new-window -k -c %1 -t explorer -n explorer"

