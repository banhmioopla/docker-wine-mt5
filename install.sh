#!/bin/bash

# Create hello.txt
echo "Hello" > hello.txt

# Pause for 30 seconds
sleep 30

# Install Exness MT5 silently
wine ./installer/exness5setup.exe /auto || {
    echo "Error: Failed to install Exness MT5" >&2
    exit 1
}

# wine '/Program Files/MetaTrader 5 EXNESS/terminal64.exe'

