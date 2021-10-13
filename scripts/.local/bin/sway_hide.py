#!/bin/python3
import subprocess
import json
workspaces_raw = subprocess.check_output(["swaymsg", "-t", "get_workspaces"])
workspaces = json.loads(workspaces_raw)
workspaces_visible = []
for ws in workspaces:
    if ws['visible'] == True:
        workspaces_visible.append(ws['name'])

if all('none' in name for name in workspaces_visible):
    subprocess.run(["swaymsg", "workspace", "none1"])
    subprocess.run(["swaymsg", "workspace", "next_on_output"])
    subprocess.run(["swaymsg", "workspace", "none2"])
    subprocess.run(["swaymsg", "workspace", "next_on_output"])
else:
    subprocess.run(["swaymsg", "workspace", "none1"])
    subprocess.run(["swaymsg", "workspace", "none2"])
