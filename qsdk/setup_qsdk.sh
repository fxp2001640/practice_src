#!/bin/sh

repo init --config-name -u https://source.codeaurora.org/quic/qsdk/releases/manifest/qstak -b release
ln -s manifests/default_NHSS.ILQ.4.0.r13-00192-P_BL.xml manifest.xml
repo sync
