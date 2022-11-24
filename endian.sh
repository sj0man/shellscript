echo -n I | od -to2 | head -n1 | awk '{print $2;}' | cut -c6

