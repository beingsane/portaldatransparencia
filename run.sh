#!/bin/bash

set -e

GASTOS=data/output/gastos-diretos.csv.xz
TRANSFERENCIAS=data/output/transferencias.csv.xz
DBNAME=data/output/gastos-governo-federal.sqlite

rm -rf data/output && mkdir -p data/output
time ./create-download-script.sh
time ./download.sh
time python converte.py gastos-diretos
time python converte.py transferencias
time rows csv2sqlite "$GASTOS" "$TRANSFERENCIAS" "$DBNAME"
