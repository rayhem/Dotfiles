set -x TERM xterm-256color

function pbcopy
  xsel --clipboard --input $argv
end

function pbpaste
  xsel --clipboard --output $argv
end

function getwd
  pwd | tr -d "\n" | pbcopy
end

function open
  xdg-open $argv
end
