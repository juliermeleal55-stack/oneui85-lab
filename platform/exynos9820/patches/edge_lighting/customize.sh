#!/usr/bin/env bash

# Fix Edge lighting corner radius using the actual vendor model.
SET_PROP "system" "ro.factory.model" "$(GET_PROP "vendor" "ro.product.vendor.model")"
