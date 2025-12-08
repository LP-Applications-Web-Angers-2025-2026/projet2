BEGIN { sum = 0.0; n = 0; }
/[0-9\.]+/{ a[n] = $1; sum += $1;  ++n; } 
END { 
	if (n == 0) { n = 1; a[0] = 0; }
	average = sum / n;
	sumsq = 0;
	for (i = 0; i < n; ++i) {
		sumsq += (a[i] - average)^2;
	}	
	printf("%7.3f;%7.3f;%d;%7.3f", average, sqrt(sumsq/n), n, sum); 
}

