#!/bin/bash
tmux new-session -d -s "mining"
tmux send -t mining 'killall teamredminer ; sudo ~/mining_tune.sh ; cd ~/Downloads/teamredminer-v0.8.3-linux ; ~/Downloads/teamredminer-v0.8.3-linux/flexpool.sh' ENTER
