#!/bin/ksh
#
# Copyright (c) 2023 Ted Bullock <tbullock@comlore.com>
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# 
# This program generates a script with ANSI colour escape codes.
#
# Although it is possible to use the tput output directly, this results
# calling the that program repeatedly for each colour assignment adding a
# non-trivial amount of time to adding ANSI colour escapes to a shell.

# check if argument is provided
if [ $# -eq 0 ]; then
  echo "Error: filename argument missing."
  exit 1
fi

# get filename from argument
filename=$1
COLOUR_FILE="${filename}"

# use $COLOUR_FILE to save preprocessed colour escape codes
print "Generating \"$COLOUR_FILE\" for ANSI colour configuration."

# Define the ANSI color codes
ANSI_BLACK=$(tput setaf 0)
ANSI_RED=$(tput setaf 1)
ANSI_GREEN=$(tput setaf 2)
ANSI_YELLOW=$(tput setaf 3)
ANSI_BLUE=$(tput setaf 4)
ANSI_MAGENTA=$(tput setaf 5)
ANSI_CYAN=$(tput setaf 6)
ANSI_WHITE=$(tput setaf 7)

ANSI_DEFAULT_BG=$(tput setab 0)
ANSI_BLACK_BG=$(tput setab 0)
ANSI_RED_BG=$(tput setab 1)
ANSI_GREEN_BG=$(tput setab 2)
ANSI_YELLOW_BG=$(tput setab 3)
ANSI_BLUE_BG=$(tput setab 4)
ANSI_MAGENTA_BG=$(tput setab 5)
ANSI_CYAN_BG=$(tput setab 6)
ANSI_WHITE_BG=$(tput setab 7)

ANSI_BOLD=$(tput bold 2>/dev/null)
ANSI_DIM=$(tput dim 2>/dev/null)
ANSI_UNDERLINE=$(tput smul 2>/dev/null)
ANSI_BLINK=$(tput blink 2>/dev/null)
ANSI_INVERT=$(tput smso 2>/dev/null)
ANSI_HIDDEN=$(tput invis 2>/dev/null)

RESET=$(tput sgr0)

cat << EOF > $COLOUR_FILE

ANSI_BLACK="$ANSI_BLACK"
ANSI_RED="$ANSI_RED"
ANSI_GREEN="$ANSI_GREEN"
ANSI_YELLOW="$ANSI_YELLOW"
ANSI_BLUE="$ANSI_BLUE"
ANSI_MAGENTA="$ANSI_MAGENTA"
ANSI_CYAN="$ANSI_CYAN"
ANSI_WHITE="$ANSI_WHITE"

ANSI_DEFAULT_BG="$ANSI_DEFAULT_BG"
ANSI_BLACK_BG="$ANSI_BLACK_BG"
ANSI_RED_BG="$ANSI_RED_BG"
ANSI_GREEN_BG="$ANSI_GREEN_BG"
ANSI_YELLOW_BG="$ANSI_YELLOW_BG"
ANSI_BLUE_BG="$ANSI_BLUE_BG"
ANSI_MAGENTA_BG="$ANSI_MAGENTA_BG"
ANSI_CYAN_BG="$ANSI_CYAN_BG"
ANSI_WHITE_BG="$ANSI_WHITE_BG"

ANSI_BOLD="$ANSI_BOLD"
ANSI_DIM="$ANSI_DIM"
ANSI_UNDERLINE="$ANSI_UNDERLINE"
ANSI_BLINK="$ANSI_BLINK"
ANSI_INVERT="$ANSI_INVERT"
ANSI_HIDDEN="$ANSI_HIDDEN"

RESET="$RESET"
EOF
