all: install deploy-manifest setup-repo

install:
	./01_setup-base.sh

setup-repo:
	./02_setup-repo.sh

deploy-manifest:
	find manifest -type f | sed s,^manifest/,, | while read line; do \
	  echo ... $$line; \
	  sudo cp manifest/$$line /$$line; \
	done
