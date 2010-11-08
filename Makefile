all: doc

doc: share/man/man8/reboot-politely.8 \
  share/man/man8/tingle.8 \
  share/man/man8/tingle-apply-updates.8 \
  share/man/man8/tingle-check-updates.8 \
  share/man/man8/tingle-warm-cache.8

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

.PHONY: all doc
