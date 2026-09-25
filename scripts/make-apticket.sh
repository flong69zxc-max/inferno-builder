#!/usr/bin/env bash
set -euo pipefail

DEVICE="${DEVICE:-n104ap}"
cd InfernoData

pip3 install --quiet pyasn1 pyasn1-modules
wget -q -O create_apticket.py \
  "https://git.chefkiss.dev/AppleHax/InfernoTools/raw/branch/master/create_apticket.py"

python3 create_apticket.py "$DEVICE" Restore/BuildManifest.plist \
  <(wget -q -O - "https://git.chefkiss.dev/AppleHax/InfernoTools/raw/branch/master/ticket.shsh2") \
  root_ticket.der
