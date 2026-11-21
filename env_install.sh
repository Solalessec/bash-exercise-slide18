#!/bin/bash
# env_install.sh - sets up a small Python development environment
# Works on Linux (Ubuntu/Debian, apt) and macOS (Homebrew).
# Exercise "Mini exercise shell & bash scripting" - OOP AIDAMS, slide 18.

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------

# Feature 1: print a message with a blank line before and after,
# so each step stands out clearly in the terminal output.
pretty_print() {
    printf "\n%s\n\n" "$1"
}

# ---------------------------------------------------------------------------
# Main logic
# ---------------------------------------------------------------------------

pretty_print "Starting environment setup..."

# Feature 2: detect the operating system with the OSTYPE variable,
# because Linux and macOS do not use the same package manager.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    pretty_print "Unsupported operating system: $OSTYPE"
    exit 1
fi
pretty_print "Detected operating system: $OS"

# Feature 3: check that python3 exists, install it if it is missing.
if command -v python3 > /dev/null 2>&1; then
    pretty_print "Python is already installed: $(python3 --version)"
else
    pretty_print "Python 3 not found, installing it..."
    if [[ "$OS" == "linux" ]]; then
        sudo apt update && sudo apt install -y python3
    else
        brew install python
    fi
fi

# Feature 4: check that pip is available and show its version.
if python3 -m pip --version > /dev/null 2>&1; then
    pretty_print "pip is available: $(python3 -m pip --version)"
else
    pretty_print "pip not found, installing it..."
    if [[ "$OS" == "linux" ]]; then
        sudo apt install -y python3-pip
    else
        python3 -m ensurepip --upgrade
    fi
    pretty_print "pip version: $(python3 -m pip --version)"
fi

# Feature 5: install Jupyter Notebook with the right package manager.
pretty_print "Installing Jupyter Notebook..."
if [[ "$OS" == "linux" ]]; then
    # Refresh the package list first, otherwise apt may try to download
    # old package versions that no longer exist on the server (404 errors).
    sudo apt update
    sudo apt install -y jupyter-notebook
else
    brew install jupyterlab
fi

# Stop with a clear message if Jupyter is still missing (error handling).
if ! command -v jupyter > /dev/null 2>&1; then
    pretty_print "Error: Jupyter Notebook installation failed."
    exit 1
fi
pretty_print "Jupyter Notebook installed: $(jupyter notebook --version)"

# Feature 6: on macOS only, check that Homebrew is healthy.
if [[ "$OS" == "macos" ]]; then
    pretty_print "Running brew doctor..."
    brew doctor
fi

pretty_print "Setup complete! Launch Jupyter with: jupyter notebook"
