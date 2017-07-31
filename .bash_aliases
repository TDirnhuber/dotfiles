alias ls='ls --color=auto'
alias cemacs='emacsclient -c'
alias demacs='emacs --daemon'
alias fuck='rm -r -f -I'
alias pics='feh -F ~/pictures'
alias hydrassh='TERM=rxvt-256color ssh -X -l TDirnhuber hydra.physics.ox.ac.uk'
alias oxvpn='sudo openconnect -b vpn.ox.ac.uk -u ball4066'
alias koiosssh='TERM=rxvt-256color ssh -X -t -l TDirnhuber hydra.physics.ox.ac.uk ssh -X -t -t koios3'
alias gpom='git push origin master'
alias gcm='git commit -m'
alias ga='git add'
alias cdgr='cd $(git rev-parse --show-toplevel)'
alias py='python'
alias gits='git status'
alias pyt='py.test'
alias wifi='sudo wifi-menu'
alias firefax='apulse firefox'

weather() {
if [ "$1" == "-n" ]
then
    curl -s wttr.in/$2 | head -7
else
    curl -s wttr.in/$1 | head -37
fi
}

cheapest() {
if [ "$1" != "" ]
then 
    curl -s https://simonpbriggs.co.uk/amazonec2/ | html2text |grep "[0-9]\.[a-z,0-9]" | grep $1 | column -ts'|' 
else 
    curl -s https://simonpbriggs.co.uk/amazonec2/ | html2text | grep "[0-9]\.[a-z,0-9]"| column -ts'|' 
fi
}

restart() {
pkill $1 && $1
}

alias kas='restart'
alias wtr='weather'
