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
# I'm canadian use my spelling for colour. :)

# Check if terminal supports colours and attributes
COLOUR_SUPPORT=$(tput colors 2>/dev/null)

# Define color and text attribute functions
bk() { colour "${ANSI_BLACK}" "$@"; }
rd() { colour "${ANSI_RED}" "$@"; }
gr() { colour "${ANSI_GREEN}" "$@"; }
ye() { colour "${ANSI_YELLOW}" "$@"; }
bl() { colour "${ANSI_BLUE}" "$@"; }
mg() { colour "${ANSI_MAGENTA}" "$@"; }
cy() { colour "${ANSI_CYAN}" "$@"; }
wh() { colour "${ANSI_WHITE}" "$@"; }

# Backgrounds
bg_bk() { bg_colour "${ANSI_BLACK_BG}" "$@"; }
bg_rd() { bg_colour "${ANSI_RED_BG}" "$@"; }
bg_gr() { bg_colour "${ANSI_GREEN_BG}" "$@"; }
bg_ye() { bg_colour "${ANSI_YELLOW_BG}" "$@"; }
bg_bl() { bg_colour "${ANSI_BLUE_BG}" "$@"; }
bg_mg() { bg_colour "${ANSI_MAGENTA_BG}" "$@"; }
bg_cy() { bg_colour "${ANSI_CYAN_BG}" "$@"; }
bg_wh() { bg_colour "${ANSI_WHITE_BG}" "$@"; }

bold() { attribute "${ANSI_BOLD}" "$@"; }
dim() { attribute "${ANSI_DIM}" "$@"; }
underline() { attribute "${ANSI_UNDERLINE}" "$@"; }
blink() { attribute "${ANSI_BLINK}" "$@"; }
invert() { attribute "${ANSI_INVERT}" "$@"; }
hidden() { attribute "${ANSI_HIDDEN}" "$@"; }

# Save last decorations so they don't get reset
LAST_FG=""	# foreground (FG)
LAST_BG=""	# background (BG)
LAST_ATTR=""	# attribute (ATTR)

# Modify the bg_colour function
bg_colour() {
  if [ -n "$COLOUR_SUPPORT" ] && [ "$COLOUR_SUPPORT" -ge 8 ]; then
    LAST_BG="${1}" # Save the background color
  fi
}

# Modify the colour function
colour() {
  if [ -n "$COLOUR_SUPPORT" ] && [ "$COLOUR_SUPPORT" -ge 8 ]; then
    LAST_FG="${1}" # Save the foreground color
  fi
}

# Modify the attribute function
attribute() {
  if [ -n "$1" ]; then
    LAST_ATTR="${1}" # Save the attribute
  fi
}

# Apply decorations to a string
decorate() {
  if [ -n "$COLOUR_SUPPORT" ] && [ "$COLOUR_SUPPORT" -ge 8 ]; then
    echo -ne "${LAST_BG}${LAST_FG}${LAST_ATTR}${1}${RESET}"
  else
    echo -n "$1"
  fi
}

# Reset decorations so that future calls won't accidentally inherit them
reset_decorations() {
  LAST_FG=""
  LAST_BG=""
  LAST_ATTR=""
}
