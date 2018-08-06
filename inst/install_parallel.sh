#!/bin/bash

# See the great excuses to not install GNU parallel
# http://oletange.blogspot.com/2013/04/why-not-install-gnu-parallel.html

(wget pi.dk/3 -qO - ||  curl pi.dk/3/) | bash
