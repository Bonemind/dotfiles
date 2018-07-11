function gcf -d "Checkout changed file"
  git status --short | cut -f 2 -d ' ' | string trim | fzf --preview='head {}' | xargs git checkout
end

