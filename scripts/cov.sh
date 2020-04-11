#!/bin/sh
find . -name '*.gcno' -exec gcov {} \;
