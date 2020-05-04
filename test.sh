#!/bin/sh
docker image build --tag dotfiles/test . && docker run -it --name test dotfiles/test; docker rm test; docker rmi dotfiles/test
