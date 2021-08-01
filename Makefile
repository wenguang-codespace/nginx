
default:	build

clean:
	rm -rf Makefile objs

.PHONY:	default clean

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/workspaces/nginx/build/sbin/nginx -t

	kill -USR2 `cat /workspaces/nginx/build/logs/nginx.pid`
	sleep 1
	test -f /workspaces/nginx/build/logs/nginx.pid.oldbin

	kill -QUIT `cat /workspaces/nginx/build/logs/nginx.pid.oldbin`

.PHONY:	build install modules upgrade
