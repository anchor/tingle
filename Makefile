RELEASE ?= $(shell cat RELEASE)
SOURCES = $(filter-out %.swp,\
  LICENCE \
  Makefile \
  README \
  README.md \
  RELEASE \
  $(shell find etc -type d -or -type f) \
  $(shell find lib -type f) \
  $(shell find ronn -type f) \
  $(shell find sbin -type f) \
  $(shell find share -type f))

all: doc

clean:
	rm -f tingle-$(RELEASE).tar.gz

doc: share/man/man8/reboot-politely.8 \
  share/man/man8/tingle.8 \
  share/man/man8/tingle-apply-updates.8 \
  share/man/man8/tingle-check-updates.8 \
  share/man/man8/tingle-reboot.8 \
  share/man/man8/tingle-warm-cache.8

install:
	install -d $(DESTDIR)/{etc/tingle/hooks/{pre,post}-{apply,check,reboot,warm}.d,usr/lib/tingle,usr/sbin}
	install -m0555 lib/tingle/* $(DESTDIR)/usr/lib/tingle/
	install -m0555 sbin/* $(DESTDIR)/usr/sbin/

share/man/man8/reboot-politely.8: ronn/reboot-politely.8.md
	ronn --pipe --roff ronn/reboot-politely.8.md > \
	  share/man/man8/reboot-politely.8

share/man/man8/tingle.8: ronn/tingle.8.md
	ronn --pipe --roff ronn/tingle.8.md > \
	  share/man/man8/tingle.8

share/man/man8/tingle-apply-updates.8: ronn/tingle-apply-updates.8.md
	ronn --pipe --roff ronn/tingle-apply-updates.8.md > \
	  share/man/man8/tingle-apply-updates.8

share/man/man8/tingle-check-updates.8: ronn/tingle-check-updates.8.md
	ronn --pipe --roff ronn/tingle-check-updates.8.md > \
	  share/man/man8/tingle-check-updates.8

share/man/man8/tingle-reboot.8: ronn/tingle-reboot.8.md
	ronn --pipe --roff ronn/tingle-reboot.8.md > \
	  share/man/man8/tingle-reboot.8

share/man/man8/tingle-warm-cache.8: ronn/tingle-warm-cache.8.md
	ronn --pipe --roff ronn/tingle-warm-cache.8.md > \
	  share/man/man8/tingle-warm-cache.8

tarball: tingle-$(RELEASE).tar.gz

tingle-$(RELEASE).tar.gz: $(SOURCES)
	@if tar --help | tail -n 1 | grep -q bsdtar ; then \
		tar -cz -f $@ -s ',^,tingle-$(RELEASE)/,' $(SOURCES) ; \
	else \
		tar -cz -f $@ --replace ',^,tingle-$(RELEASE)/,' $(SOURCES) ; \
	fi

.PHONY: all doc install tarball
