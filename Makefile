OS_NAME := $(shell uname -s | tr A-Z a-z)
SHELL := /bin/bash

.PHONY: all
all: canister-build

install: canister-build
	dfx canister install --all --mode reinstall

canister-build: canister-create
	dfx build

canister-create: start
	dfx canister create --all

start:
	if [ -f .dfx/pid ]; then \
	  echo "Already started."; \
	else \
		dfx start --background; \
	fi

stop:
	dfx stop

clean: stop
	rm -rf .dfx

os:
	@echo $(OS_NAME)

URL := "http://localhost:8000/?canisterId=$(shell dfx canister id hello_assets)"
web: 
	if [[ "$(OS_NAME)" == "darwin" ]]; then \
	  echo "This is web in darwin!"; \
	  open -a /Applications/Google\ Chrome.app $(URL); \
	elif [[ "$(OS_NAME)" == "linux" ]]; then \
	  echo "This is web in linux!"; \
	  google-chrome $(URL); \
	else \
	  echo "I don't know what to do on $(OS_NAME)"; \
	fi