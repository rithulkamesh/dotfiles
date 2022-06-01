import argparse
import os

path = os.path.expanduser('~') + "/Library/Application Support/Übersicht/widgets/currentTask/data.json"
# get args from command line and set the task in path
parser = argparse.ArgumentParser()
parser.add_argument("-t", "--task", help="set the task")
args = parser.parse_args()

if not args.task:
    exit("\n\033[91mERROR:\033[0m No task specified\n\033[94mUsage:\033[0m \033[1m task.py -t <task>")

# Open the file and set the object's task as the task from args
with open(path, "w") as f:
    f.write(f"""
    {{"task": "{args.task}"}}
    """)