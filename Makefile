all:
	cabal configure
	cabal build

watch:
	while inotifywait -re close_write,moved_to,create src; do make; done

clean:
	rm -rf dist
