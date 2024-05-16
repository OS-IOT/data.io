#!/bin/bash

pip3 install minio && python3 /run/startup-scripts/create_bucket.py && exit 0