python pq.py printPDFPaths | parallel 'gs -q -dSAFER -sDEVICE=bbox -dFirstPage=1 -dLastPage=1 -f "{}" 2>&1 | grep %BoundingBox | sed -e s/%%BoundingBox:\ //g | tr -s " " "\t" | sed -e s/^/{/.}\\t/g' 
