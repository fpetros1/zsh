#!/usr/bin/env bash

git config --global pull.rebase true

git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "#C34043"
git config --global color.diff-highlight.oldHighlight "#C34043 #43242B bold"
git config --global color.diff-highlight.newNormal    "#98BB6C"
git config --global color.diff-highlight.newHighlight "#98BB6C #2B3328 bold"

git config --global color.diff.meta       "#DCA561"
git config --global color.diff.frag       "#957FB8 bold"
git config --global color.diff.func       "#7E9CD8 bold"
git config --global color.diff.commit     "#DCA561 bold"
git config --global color.diff.old        "#C34043 bold"
git config --global color.diff.new        "#98BB6C bold"
git config --global color.diff.whitespace "#DCA561 reverse"
