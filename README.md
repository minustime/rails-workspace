# Overview

Simple development environment to learn Rails.

# Usage

```
$ docker run -it -v `pwd`/workspace:/opt/workspace minustime/rails-workspace zsh
```

_OR_

1. Clone this repo:
```
$ git clone git@github.com:minustime/rails-workspace.git && cd rails-workspace
```

2. Build, run and access the container: 
```
$ make code
```

# Project layout

```
├── Dockerfile
├── Makefile
├── README.md
├── docker
│   ├── init.vim             # Default Neovim config file
│   └── zshrc                # Default .zshrc file
├── docker-compose.yml
└── workspace                # Workspace directory, mapped to container's /opt/workspace directory
```

# Fun features

* Oh My Zsh + vim-mode
* Neovim


