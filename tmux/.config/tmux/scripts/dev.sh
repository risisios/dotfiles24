#!/usr/bin/bash

if [ ! $# -eq 2 ]
then
    echo Error: not enough arguments
    return 1
fi

SESSION_NAME=$1
SESSION_PATH=$2

if [ $(tmux attach-session -t "${SESSION_NAME}") ];
then
    echo Info: attaching to session ${SESSION_NAME}
    return 0
else
    echo Info: creating a new session
fi

export TM_HOME=$2

tmux new-session -d -s "${SESSION_NAME}" -n explorer -c "${SESSION_PATH}"
tmux new-window -t "${SESSION_NAME}" -n nvim -c "${SESSION_PATH}"
tmux new-window -t "${SESSION_NAME}" -n build -c "${SESSION_PATH}"
tmux new-window -t "${SESSION_NAME}" -n debugger -c "${SESSION_PATH}"
tmux attach-session -t "${SESSION_NAME}"

