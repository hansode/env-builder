all: deploy-manifest install

install:
	./01_setup-base.sh

deploy-manifest:
	find manifest -type f | sed s,^manifest/,, | while read line; do \
	  echo ... $$line; \
	  [ -f /$$line ] || sudo cp manifest/$$line /$$line; \
	done
