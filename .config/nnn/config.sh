#!/bin/sh

export NNN_PLUG='f:fzcd;o:fzopen;p:mocplay;d:diffs;m:nmount;v:imgview;e:suedit;t:treeview'
export NNN_COLORS='a5a5a5a5'
export NNN_FCOLORS='c2e2042e006033f7c6d6abc4'
export NNN_TRASH=

cd_nnn ()
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
