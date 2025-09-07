for f in *; do
    new=$(echo "$f" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    [ "$f" != "$new" ] && mv -- "$f" "$new"
done
