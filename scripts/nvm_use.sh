#!/bin/bash

if [ ! -f .nvmrc ]; then
    exit 1
fi

nvm use
clear
