.DEFAULT_GOAL := help

.PHONY: help install apply versioning

help:
	@printf '%s\n' \
		'install      Install dev tools' \
		'apply        Copy .bash_profile to $$HOME' \
		'versioning   Copy $$HOME/.bash_profile into this directory'

install:
	bash install-tools.sh

apply:
	bash bashapply.sh

versioning:
	bash versioning.sh
