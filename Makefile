BINDIR=/usr/sbin
CACHEDIR=/tmp
CONFDIR=/etc/trustsync

install:
	install trustsync $(BINDIR)/trustsync
	install -d $(CACHEDIR)
	sed -e "s{/etc/trustsync{$(CONFDIR){" \
	    -e "s{cache_dir = '.*'{cache_dir = '$(CACHEDIR)'{" \
	    trustsync > $(BINDIR)/trustsync

install-conf:
	install -d $(CONFDIR)
	install conf/trustsync.conf $(CONFDIR)/trustsync.conf
	install conf/domain-blacklist $(CONFDIR)/domain-blacklist
	install conf/domain-whitelist $(CONFDIR)/domain-whitelist
	install conf/template-header-zone $(CONFDIR)/template-header-zone
	install conf/template-rr $(CONFDIR)/template-rr
	sed -e "s{/etc/trustsync{$(CONFDIR){" \
	    -e "s{--cache-dir .*{--cache-dir $(CACHEDIR){" \
	    conf/trustsync.conf > $(CONFDIR)/trustsync.conf

uninstall:
	rm -f $(BINDIR)/trustsync

uninstall-conf:
	rm -f $(CONFDIR)/trustsync.conf
	rm -f $(CONFDIR)/domain-blacklist
	rm -f $(CONFDIR)/domain-whitelist
	rm -f $(CONFDIR)/template-header-zone
	rm -f $(CONFDIR)/template-rr
