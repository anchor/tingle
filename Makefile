VERSION := $(shell \
	git describe --dirty --tags --long --match 'v*' 2>/dev/null \
	| awk -F '-' -v OFS='-' '\
		{ \
			sub(/^v/, "", $$1); \
			if ($$NF == "dirty") { \
				print $$0 \
			} else { \
				print $$1 \
			} \
		}; \
		END { if (NR == 0) { exit 1 } }' \
	|| echo '0-unknown')


all: doc

.PHONY: all


clean:
	rm -f dist/tingle-*.tar.gz

.PHONY: clean


dist:
	mkdir -p 'dist'
	git archive --worktree-attributes --prefix='tingle-$(VERSION)/' \
		--output='dist/tingle-$(VERSION).tar.gz' HEAD

.PHONY: dist


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
