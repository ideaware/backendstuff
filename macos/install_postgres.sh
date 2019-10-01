#!/bin/bash

brew install postgresql

createdb $(whoami)
