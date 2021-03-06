GTK_VERSION = 2
PRJ_NAME = gtk$(GTK_VERSION)Imager
CC = gcc
CFLAGS =  -Wall `pkg-config --cflags glib-2.0 gtk+-$(GTK_VERSION).0`
LDFLAGS =
LDLIBS = `pkg-config --libs glib-2.0 gtk+-$(GTK_VERSION).0` -lcfitsio -lusb-1.0 -lrt -lm

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

$(PRJ_NAME):imgMain
	mv $< $@

imgMain:$(OBJ)

OSI_DIR = OpenSkyImager
INSTALL_DIR = /usr/local/bin/$(OSI_DIR)
.PHONY: install
install:$(PRJ_NAME)
	rm -rf $(INSTALL_DIR)
	mkdir -p $(INSTALL_DIR)
	cp -p $(PRJ_NAME) $(INSTALL_DIR)
	cp -p -r fr_FR $(INSTALL_DIR)
	cp -p -r it_IT $(INSTALL_DIR)
	cp -p -r zh_CN $(INSTALL_DIR)
	cp -p -r po $(INSTALL_DIR)
	cp -p qhyReset.bash $(INSTALL_DIR)
	cp -p *.png $(INSTALL_DIR)
	chmod a+rx $(INSTALL_DIR)/$(PRJ_NAME)
	chmod a+rx $(INSTALL_DIR)/qhyReset.bash

.PHONY: clean
clean:
	rm -f *.o
	rm -f $(PRJ_NAME)
