# Bash exercise - Slide 18

Mini exercise to learn shell and bash scripting (OOP course, AIDAMS 2A).

## Part 1 - Shell setup
- Shell in use: bash (`echo $0` gives `-bash`), login shell: `/bin/bash` (`echo $SHELL`)
- Framework: Oh My Bash, theme `brainy`
- Git plugin enabled in `~/.bashrc`: the alias `gst` runs `git status`
- **What does `source` do?** `source ~/.bashrc` runs the file in the current shell,
  so configuration changes apply immediately without restarting the terminal.

## Part 2 - Python check
- `python --version`: command not found (Ubuntu only provides `python3`)
- `python3 --version`: Python 3.14.4

## Part 3 - env_install.sh
The script:
1. Prints readable messages with a `pretty_print` function (`printf`)
2. Detects the operating system with `$OSTYPE` (Linux or macOS)
3. Checks that `python3` is installed, installs it otherwise (apt / brew)
4. Checks that pip is available and shows its version
5. Refreshes the package list, then installs Jupyter Notebook (apt on Linux, brew on macOS)
6. Runs `brew doctor` on macOS only

Error handling: the script stops with a clear message if Jupyter is still missing after installation.

## How to run
```bash
chmod +x env_install.sh
./env_install.sh
```

## Part 4 - Verification (Ubuntu on WSL, Windows)
- [x] Shell prompt shows the Oh My Bash theme
- [x] `gst` works like `git status`
- [x] Python 3.14.4
- [x] pip 25.1.1
- [x] Jupyter Notebook 6.4.13
- [ ] `brew doctor`: not applicable (Linux)
