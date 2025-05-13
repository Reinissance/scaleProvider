#!/bin/bash

# sparse-checkout for abs submodule
ABS_DIR="scaleProvider/abs"
ABS_SUBMODULE_PATH="/doubleLongClick.pd
/vanillaMenu-help.pd
/vanillaMenu.pd
/gmInst.pd
/m2chordscale-help.pd
/LICENSE.txt
/doubleLongClick-help.pd
/m2chordscale.pd"

cd $ABS_DIR || exit

git sparse-checkout init --no-cone
git sparse-checkout set --skip-checks $ABS_SUBMODULE_PATH

git sparse-checkout reapply

# sparse-checkout for list-abs submodule
LIST_ABS_DIR="list-abs"
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

cd $LIST_ABS_DIR || exit

git sparse-checkout init --no-cone
git sparse-checkout set --skip-checks $LIST_ABS_SUBMODULE_PATH

git sparse-checkout reapply

# sparse-checkout for rc submodule
RC_DIR="../../rc"
RC_SUBMODULE_PATH="/README.md
/LICENSE.txt
/rc/u_symbol2list.pd
/rc/u_symbol2list-help.pd
/rc/u_list2symbol.pd
/rc/u_list2symbol-help.pd
/rc/u_symbol2float-help.pd
/rc/u_symbol2float.pd"

cd $RC_DIR || exit

git sparse-checkout init --no-cone
git sparse-checkout set --skip-checks $RC_SUBMODULE_PATH

git sparse-checkout reapply

# sparse-checkout for rjlib submodule
RJLIB_DIR="../rjlib"
RJLIB_SUBMODULE_PATH="rj/m_symbolarray.pd
rj/u_listmap.pd
rj/m_symbolarray-help.pd
rj/u_listdrip.pd
rj/u_listmap-help.pd
rj/LICENSE.txt
rj/u_listdrip-help.pd"

cd $RJLIB_DIR || exit

git sparse-checkout init --no-cone
git sparse-checkout set --skip-checks $RJLIB_SUBMODULE_PATH

git sparse-checkout reapply