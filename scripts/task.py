import argparse

path = "/Users/rithulkamesh/Library/Application Support/Übersicht/widgets/currentTask/data.json"
# get args from command line and set the task in path
parser = argparse.ArgumentParser()
parser.add_argument("-t", "--task", help="set the task")
args = parser.parse_args()

# Open the file and set the object's task as the task from args
with open(path, "w") as f:
    f.write(f"""
    {{"task": "{args.task}"}}
    """)