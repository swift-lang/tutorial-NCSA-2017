#!/bin/sh
set -eu

export SWIFT_PATH=${PWD}

swift-t dot.swift
