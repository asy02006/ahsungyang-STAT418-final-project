#!/bin/bash

curl http://localhost:5000/

curl -H "Content-Type: application/json" -X POST -d '{"text":"we pressure women lawyers worth"}' "http://localhost:5000/predict_price"
