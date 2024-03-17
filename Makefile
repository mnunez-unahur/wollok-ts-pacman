prepare: 
	apt install reflex
dev:
	reflex  -r '\.(wlk|wpgm)' -s -- sh -c 'wollok-ts run -g pacman.main'
run:
	wollok-ts run -g pacman.main
