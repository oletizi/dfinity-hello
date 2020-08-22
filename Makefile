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