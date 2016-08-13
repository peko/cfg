#!/bin/bash
systemctl disable kmsconvt@tty1.service
systemctl enable getty@tty1.service

