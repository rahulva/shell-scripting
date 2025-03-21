#!/bin/bash
echo "What is your name?"
read name
if [ $name ]; then
  echo "$name sounds like genious"
else
  echo "Something not right\!"
fi
