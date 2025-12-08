BEGIN { min = 100000; max = 0; }
/[0-9\.]+/{ 
	if ($1 < min) min = $1;
	if ($1 > max) max = $1;
} 
END { 
	printf("%7.3f;%7.3f", min, max); 
}

