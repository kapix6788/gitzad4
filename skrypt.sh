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
    echo "--date   Wyswietla dzisiejsza date"
    echo "--logs [liczba] Tworzy atomatycznie pliki log_x.txt"
    echo "--help Wyswietla wszytkie opcje"
}

case $1 in
    --date)
        show_date
        ;;
    --logs)
        create_logs $2
        ;;
    --help)
        show_help
        ;;
    *)
        echo "Nieznana opcja: $1"
        show_help
        ;;
esac
