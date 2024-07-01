#!/bin/bash

function show_date() {
    echo $(date +%Y-%m-%d)
}

function create_logs() {
    num_files=${1:-100}
    for ((i=1; i<=num_files; i++)); do
        filename="log_${i}.txt"
        echo "Nazwa skryptu to $0" > $filename
    done
}

function show_help() {
    echo "Dostepne opcje:"
    echo "-d   Wyswietla dzisiejsza date"
    echo "-l [liczba] Tworzy atomatycznie pliki log_x.txt"
    echo "-h Wyswietla wszytkie opcje"
}

while getopts ":d:h" opt; do
  case ${opt} in
       d)
          show_date
          ;;
       l)
          create_logs $OPTARG
          ;;
       h)
          show_help
          ;;
      \?)
          echo "Nieznana opcja: $OPTARG"
          show_help
          ;;
  esac
done
