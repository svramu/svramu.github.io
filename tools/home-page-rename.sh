for f in _posts/2025-09-06-home-page---*; do
  [ -e "$f" ] || continue  # skip if no match
  last_date=$(echo "$f" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | tail -n1)
  base=$(basename "$f" | sed -E 's/^2025-09-06-//; s/---/-/g')
  if [ -n "$last_date" ]; then
    new_name="_posts/${last_date}-${base}"
    mv "$f" "$new_name"
  fi
done
