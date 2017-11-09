alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-select-history'
bind    '"\C-xr": reverse-search-history'
