#!/bin/bash

export DFX_MOC_PATH="$(vessel bin)/moc"
DEV_PRINCIPAL=$(dfx identity get-principal)

dfx deploy storage --upgrade-unchanged --argument '(principal "'${DEV_PRINCIPAL}'")' --mode reinstall --yes
cp .dfx/local/canisters/storage/service.did.js .dfx/local/canisters/storage/service.did.mjs

unset DFX_MOC_PATH