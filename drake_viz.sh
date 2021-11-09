#!/bin/bash

docker exec -u ubuntu -w /home/ubuntu/drake -it drake-master bazel run //tools:drake_visualizer
