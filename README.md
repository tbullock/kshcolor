# kshcolor - KSH Color Setting System

The KSH color setting system is a set of scripts and functions that enable
you to customize the appearance of your KornShell (KSH) prompt with various
colors and text attributes. This system is designed to be integrated into your
existing shell environment. It was created on OpenBSD, mileage on other OS
may vary.

## Features
- Easy-to-use functions for setting text colors and attributes
- Automatic detection of terminal color support
- Customizable prompt string with support for colors and source control information
- Makefile for easy installation and testing

## Installation

Clone the repository or download the source files.

Run `make install` to install the KSH color setting system. This will copy the
`kshcolor.sh` script to `~/bin/kshcolor.sh` in your home directory.

Add the following lines to your .profile or .kshrc file:

```
if [ -f ~/bin/kshcolor.sh ]; then
  . ~/bin/kshcolor.sh
  # Add any customization you want here
fi
```

Restart your shell or run `source ~/.profile` or `source ~/.kshrc` to apply
the changes.

## Usage

To use the KSH color setting system, call the provided functions in your
prompt string or anywhere in your shell environment.

### Setting text colors

The following functions are available for setting text colors:

```
bk	# Sets Black
rd	# Sets Red
gr	# Sets Green
ye	# Sets Yellow
bl	# Sets Blue
mg	# Sets Magenta
cy	# Sets Cyan
wh	# Sets White
```

### Setting background colors

The following functions are available for setting background colors:

```
bg_bk	# Sets background Black
bg_rd	# Sets background Red
bg_gr	# Sets background Green
bg_ye	# Sets background Yellow
bg_bl	# Sets background Blue
bg_mg	# Sets background Magenta
bg_cy	# Sets background Cyan
bg_wh	# Sets background White
```

### Applying text attributes

The following functions are available for applying text attributes:

```
bold		# Bold
dim		# Dim
underline	# Underline
blink		# Blink (this may not be implemented by your terminal)
invert		# Invert
hidden		# Hidden
```

### Resetting decorations

To reset the text colors and attributes to their default values, use the
`reset_decorations` function.

### Example

Here's an example of how you could customize your prompt string with colors
and source control information:

```
# Determine if this is a source directory (requires git, got and cvs)
function scm_type {
  local scm
  if git rev-parse --git-dir >/dev/null 2>&1; then
    scm="[git]"
  elif got info >/dev/null 2>&1; then
    scm="[got]"
  elif [ -d CVS ]; then
    scm="[cvs]"
  else
    scm=""
  fi
  echo $scm
}

# Generate the prompt string
function prompt_string {
  local prompt
  if [ -f ~/bin/kshcolor.sh ]; then
    . ~/bin/kshcolor.sh
    bold
    rd
    local scm=$(decorate "$(scm_type)")
    ye
    local host=$(decorate "\h")
    bl
    local workdir=$(decorate "\W")
    reset_decorations
    prompt="\[$scm$host $workdir\$ \]"
  else
    prompt="$(scm_type)\h \W\$ "
  fi
  echo $prompt
}

PS1='$(prompt_string)'
```

## Testing

To test your system and verify that all decorations work correctly, run
`make test`. This will execute the test_colours.sh script, which generates
a grid of all possible color and attribute combinations in your terminal.

## License

This software is written by Ted Bullock and released under the ISC License.
Please refer to the included LICENSE file for more information.
