RELEASE ?= $(shell cat RELEASE)

SOURCES = LICENCE \
	Makefile \
	README.md \
	RELEASE \
	$(shell find etc -type f) \
	$(shell find etc/tingle/hooks -type f | \
		perl -nle 'use File::Basename; print dirname $$_ if -f $$_;' | \
		sort | uniq -c | awk '{ if ($$1 == "1") print $$2; }') \
	$(shell find lib -type f) \
	$(shell find ronn -type f) \
	$(shell find sbin -type f) \
	$(shell find share -type f)


all: doc

.PHONY: all


clean:
	rm -f dist/tingle-$(RELEASE).tar.gz

.PHONY: clean


dist: dist/tingle-$(RELEASE).tar.gz

.PHONY: dist


dist/tingle-$(RELEASE).tar.gz: $(SOURCES)
	@if tar --help | tail -n 1 | grep -q bsdtar ; then \
		tar --exclude '.*.swp' --exclude '.gitignore' \
			-cz -f $@ -s ',^,tingle-$(RELEASE)/,' $(SOURCES) ; \
	else \
		tar --exclude '.*.swp' --exclude '.gitignore' \
			-cz -f $@ --transform 's,^,tingle-$(RELEASE)/,' $(SOURCES) ; \
	fi

.PHONY: dist/tingle-$(RELEASE).tar.gz


install: doc
	install -d $(DESTDIR)/etc/tingle
	install -d $(DESTDIR)/etc/tingle/hooks
	install -d $(DESTDIR)/etc/tingle/hooks/pre-apply.d
	install -d $(DESTDIR)/etc/tingle/hooks/pre-check.d
	install -d $(DESTDIR)/etc/tingle/hooks/pre-reboot.d
	install -d $(DESTDIR)/etc/tingle/hooks/pre-warm.d
	install -d $(DESTDIR)/etc/tingle/hooks/post-apply.d
	install -d $(DESTDIR)/etc/tingle/hooks/post-check.d
	install -d $(DESTDIR)/etc/tingle/hooks/post-reboot.d
	install -d $(DESTDIR)/etc/tingle/hooks/post-warm.d
	install -d $(DESTDIR)/usr/lib/tingle
	install -d $(DESTDIR)/usr/sbin
	install -d $(DESTDIR)/usr/share/man/man8
	install -m0444 etc/tingle/unimportant-packages $(DESTDIR)/etc/tingle/unimportant-packages
	install -m0444 etc/tingle/unimportant-packages $(DESTDIR)/etc/tingle/unimportant-packages
	install -m0555 etc/tingle/hooks/post-apply.d/* $(DESTDIR)/etc/tingle/hooks/post-apply.d/
	install -m0555 lib/tingle/* $(DESTDIR)/usr/lib/tingle/
	install -m0555 sbin/* $(DESTDIR)/usr/sbin/
	install -m0444 share/man/man8/* $(DESTDIR)/usr/share/man/man8/

.PHONY: install


doc: \
	share/man/man8/reboot-politely.8 \
	share/man/man8/tingle.8 \
	share/man/man8/tingle-apply-updates.8 \
	share/man/man8/tingle-check-updates.8 \
	share/man/man8/tingle-reboot.8 \
	share/man/man8/tingle-warm-cache.8

.PHONY: doc


share/man/man8/%: ronn/%.md
	ronn --pipe --roff $< > $@
