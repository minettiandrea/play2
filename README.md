Description
===========

Chef cookbook for the Play 2 framework.

Play 2 is a high-productivity Java and Scala web application framework that integrates the components and APIs you need for modern web application development.

Play is based on a lightweight, stateless, web-friendly architecture and features predictable and minimal resource consumption (CPU, memory, threads) for highly-scalable applications thanks to its reactive model, based on Iteratee IO.

This recipe download the binary release from playframework website.

http://www.playframework.org
https://github.com/playframework/Play20/wiki

Based on Arnaud Tanguy Recipe


Requirements
============

## Platform:

* Debian/Ubuntu


## Cookbooks:

* java

Attributes
==========

include_recipe "play2"

version: release of play2 framework

Usage
=====

This cookbook installs play2 core packages.

    include_recipe "play2"

This creates the directory /srv/play-version.
Play 2.0 framework shell play command