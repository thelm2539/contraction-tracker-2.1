#!/usr/bin/env bash
set -euo pipefail

# Deploy Breathe & Birth to Firebase Hosting
# Prerequisites:
#   1. Node.js installed (https://nodejs.org)
#   2. Firebase project created at https://console.firebase.google.com
#   3. Realtime Database enabled (not Firestore)
#   4. firebaseConfig in index.html updated with your project values
#   5. .firebaserc updated with your project ID

if ! command -v npx &>/dev/null; then
  echo "Error: npx not found. Install Node.js first."
  exit 1
fi

if grep -q "REPLACE_WITH" index.html; then
  echo "Error: Replace Firebase placeholder values in index.html before deploying."
  exit 1
fi

if grep -q "REPLACE_WITH" .firebaserc; then
  echo "Error: Replace project ID in .firebaserc before deploying."
  exit 1
fi

echo "Deploying database rules..."
npx firebase-tools deploy --only database

echo "Deploying hosting..."
npx firebase-tools deploy --only hosting

echo "Done. Share your app URL with ?s=SESSIONCODE to sync devices."
