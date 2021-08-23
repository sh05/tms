#/bin/sh

# command

if [ -z $1  ]; then
  echo "here is no args"
  exit 2
fi

SUBCOMMAND=$1
IS_GLOBAL=$2
TODO_FILE="todo.md"
CONFIG_FILE="config.md"

if [ $SUBCOMMAND = "init" ]; then
  if [ -z $IS_GLOBAL ]; then
    TARGET=$PWD
  elif [ $IS_GLOBAL = "-g" ]; then
    TARGET=$HOME
    echo "global pass now!"
    exit 2
  else
    echo "other flag!"
    exit 2
  fi

  TMS_DIR=$TARGET/.tms/
  if [ -d $TMS_DIR ]; then
    echo "Already initialized!"
  else
    mkdir $TMS_DIR
    touch $TMS_DIR/$TODO_FILE
    touch $TMS_DIR/$CONFIG_FILE
    echo "Initialized!"
  fi

elif [ $SUBCOMMAND = "rm" ]; then
  if [ -z $IS_GLOBAL ]; then
    TARGET=$PWD
  elif [ $IS_GLOBAL = "-g" ]; then
    TARGET=$HOME
    echo "global pass now!"
    exit 2
  else
    echo "other flag!"
    exit 2
  fi
  TMS_DIR=$TARGET/.tms/
  rm -rf $TMS_DIR
else
  echo "pass!"
fi
