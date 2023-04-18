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

. ./kshcolor.sh

# Define the list of foreground and background color functions
set -A fg_functions "bk" "rd" "gr" "ye" "bl" "mg" "cy" "wh"
set -A bg_functions "bg_bk" "bg_rd" "bg_gr" "bg_ye" "bg_bl" "bg_mg" "bg_cy" "bg_wh"

# Loop through all foreground colors
for fg_func in "${fg_functions[@]}"; do
  # Apply the foreground color
  $fg_func

  # Loop through all background colors
  for bg_func in "${bg_functions[@]}"; do
    # Apply the background color
    $bg_func

    # Create a decorated string with the current color combination
    decorated_text=$(decorate " ${fg_func} ")

    # Display the decorated string
    echo -n "$decorated_text"
  done

  # Reset to the next line
  echo
done

print

# Test bold attribute with different foreground and background colors
bold
for fg_func in "${fg_functions[@]}"; do
  $fg_func
  
  for bg_func in "${bg_functions[@]}"; do
    $bg_func
    decorated_text=$(decorate " ${fg_func} ")
    echo -n "$decorated_text"
  done

  # Reset to the next line
  echo
done

print

# Test other attributes
set -A attribute_list "dim" "underline" "blink" "invert" "hidden"
for attr in "${attribute_list[@]}"; do
  $attr
  rd
  decorated_text=$(decorate " ${attr} ")
  echo -n "$decorated_text"
done

print