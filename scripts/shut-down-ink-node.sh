#!/bin/bash
set -e

kill -9 $(lsof -i :9944)
