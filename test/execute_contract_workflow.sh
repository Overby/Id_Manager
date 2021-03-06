#!/usr/bin/env bash

#-----------------------------------------------------------------
# This script simulates interaction from a WebUI or smartphone App
#-----------------------------------------------------------------

API='http://127.0.0.1:8080'

#--------------------
# Destroy existing DB
#--------------------

echo "API: ${API}"

curl "${API}/api" \
  -H 'content-type: application/json'  \
  --data-binary '{"id":1,"method":"schema_destroy","params":["event"]}'

#----------------
# Create a new DB
#----------------

curl "${API}/api" \
  -H 'content-type: application/json'  \
  --data-binary '{"id":3,"method":"schema_create","params":["workflow","workflow"]}'

#--------------------
# create event stream
#--------------------

curl "${API}/api" \
  -H 'content-type: application/json'  \
  --data-binary '{"id":5,"method":"stream_create","params":["workflow", "workflow_stream_guid"]}'

#-------------------------
# create factom blockchain
#-------------------------

curl "${API}/dispatch/event/workflow_stream_guid/create_chain" \
  -H 'content-type: application/json' \
  --data-binary '{"msg": "NOTE: this event causes chain to be created on factom blockchain"}'

# TODO: actually send events that simulate the completion of a workflow contract
