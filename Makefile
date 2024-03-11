prepare: 
	apt install reflex
dev:
	reflex  -r '\.(wlk|wpgm)' -s -- sh -c 'wollok run -g pacman.main'
