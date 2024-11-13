#!/bin/sh

flutter build web --release --enable-experiment=macros
firebase deploy --only hosting
