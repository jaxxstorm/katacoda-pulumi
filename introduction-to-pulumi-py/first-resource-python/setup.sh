#!/bin/bash

spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 1
    done
  done
}

echo "Configuring environment"

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!

# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`

while [ ! -x ${HOME}/.pulumi/bin/pulumi ]
do
  sleep 2
done

echo "Finished."

# If the script is going to exit here, there is nothing to do.
# The trap above will kill the spinner when this script exits.
# Otherwise, if the script is going to do more stuff, you can
# kill the spinner now:
kill -9 $SPIN_PID

# Reload the shell
export PATH=${PATH}:${HOME}/.pulumi/bin
