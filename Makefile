all: doc

doc: share/man/man8/reboot-politely.8 \
  share/man/man8/tingle.8 \
  share/man/man8/tingle-apply-updates.8 \
  share/man/man8/tingle-check-updates.8 \
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

share/man/man8/tingle-warm-cache.8: ronn/tingle-warm-cache.8.md
	ronn --pipe --roff ronn/tingle-warm-cache.8.md > \
	  share/man/man8/tingle-warm-cache.8

.PHONY: all doc install
