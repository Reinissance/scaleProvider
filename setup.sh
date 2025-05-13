#!/bin/bash

# Debugging: Print the current working directory
echo "Current working directory: $(pwd)"

# Define the base directory
BASE_DIR="$(pwd)"

# Function to perform sparse-checkout for a submodule
perform_sparse_checkout() {
  local SUBMODULE_DIR=$1
  local SUBMODULE_PATHS=$2

  echo "Setting up sparse-checkout for submodule: $SUBMODULE_DIR"

  # Check if the directory exists
  if [ ! -d "$SUBMODULE_DIR" ]; then
    echo "Error: Directory $SUBMODULE_DIR does not exist."
    exit 1
  fi

  # Change to the submodule directory
  cd "$SUBMODULE_DIR" || exit
  echo "Changed directory to $(pwd)"

  # Debugging: List contents of the directory
  echo "Contents of $SUBMODULE_DIR:"
  ls -la

  # Perform sparse-checkout
  git sparse-checkout init --no-cone
  git sparse-checkout set --skip-checks $SUBMODULE_PATHS
  git sparse-checkout reapply
  echo "Sparse-checkout for $SUBMODULE_DIR completed."

  # Return to the base directory
  cd "$BASE_DIR" || exit
  echo "Returned to base directory: $(pwd)"
}

# Ensure the parent directory is not affected by sparse-checkout
cd "$BASE_DIR" || exit
git sparse-checkout disable

# sparse-checkout for abs submodule
ABS_DIR="$BASE_DIR/scaleProvider/abs"
ABS_SUBMODULE_PATH="/doubleLongClick.pd
/vanillaMenu-help.pd
/vanillaMenu.pd
/gmInst.pd
/m2chordscale-help.pd
/LICENSE.txt
/doubleLongClick-help.pd
/m2chordscale.pd"
perform_sparse_checkout "$ABS_DIR" "$ABS_SUBMODULE_PATH"

# sparse-checkout for list-abs submodule
LIST_ABS_DIR="$BASE_DIR/scaleProvider/abs/list-abs"
LIST_ABS_SUBMODULE_PATH="/list-len-help.pd
/list-map.pd
/list-dripslow.pd
/list-drip.pd
/list-splat.pd
/compare-any-help.pd
/list-dripslow-help.pd
/list-filter.pd
/list-drip-help.pd
/list-sort-help.pd
/list-unique-help.pd
/list-find.pd
/list-replace-help.pd
/list-sort.pd
/list-splat-help.pd
/list-filter-help.pd
/list-rdrip.pd
/list-compare-help.pd
/list-replace.pd
/list-len.pd
/list-compare.pd
/LICENSE.txt
/list-unique.pd
/compare-any.pd
/list-map-help.pd
/list-find-help.pd"
git submodule update --init --recursive
perform_sparse_checkout "$LIST_ABS_DIR" "$LIST_ABS_SUBMODULE_PATH"

# sparse-checkout for rc submodule
RC_DIR="$BASE_DIR/scaleProvider/rc"
RC_SUBMODULE_PATH="/README.md
/LICENSE.txt
/rc/u_symbol2list.pd
/rc/u_symbol2list-help.pd
/rc/u_list2symbol.pd
/rc/u_list2symbol-help.pd
/rc/u_symbol2float-help.pd
/rc/u_symbol2float.pd"
perform_sparse_checkout "$RC_DIR" "$RC_SUBMODULE_PATH"

# sparse-checkout for rjlib submodule
RJLIB_DIR="$BASE_DIR/scaleProvider/rjlib"
RJLIB_SUBMODULE_PATH="rj/m_symbolarray.pd
rj/u_listmap.pd
rj/m_symbolarray-help.pd
rj/u_listdrip.pd
rj/u_listmap-help.pd
rj/LICENSE.txt
rj/u_listdrip-help.pd"
perform_sparse_checkout "$RJLIB_DIR" "$RJLIB_SUBMODULE_PATH"

# Restore all files in the scaleProvider directory
echo "Restoring all files in the scaleProvider directory..."
cd "$BASE_DIR/scaleProvider" || exit
git sparse-checkout disable
git checkout .
