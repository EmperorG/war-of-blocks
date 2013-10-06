#!/usr/bin/make

INSTALL=/usr/bin/install

install-local:
	mkdir -p ~/.minetest/games/war-of-blocks/
	cp -pra game.conf mods/ menu/ ~/.minetest/games/war-of-blocks/

test: install-local
	minetest

.PHONY: install-local
