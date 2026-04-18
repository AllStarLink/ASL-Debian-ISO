systemd ?= /etc/systemd/system
prefix ?= /usr/local

BINS = \
	asl3-firstboot \
	asl3-firstboot-complete \
	asl3-firstboot-pkg-updates

SYSTEMDS = \
	asl3-firstboot-complete.service \
	asl3-firstboot-pkg-updates.service \
	asl3-firstboot.service

BINS_INST = $(patsubst %, $(prefix)/bin/%, $(BINS))
SYSTEMD_INST = $(patsubst %, $(systemd)/%, $(SYSTEMDS))

INSTALLABLES = $(BINS_INST) $(SYSTEMD_INST)

.PHONY: install
install:	$(INSTALLABLES)

$(prefix)/bin/%:	%
	install -m 0755 $< $@

$(systemd)/%:	%
	install -m 0644 $< $@
	deb-systemd-invoke enable $@

