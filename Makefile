install:
	bundle install

test:
	rake test

lint:
	rubocop ./lib ./test

.PHONY: test
