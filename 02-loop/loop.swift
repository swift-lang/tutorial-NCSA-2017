
/**
   Example 2 - LOOP.SWIFT
*/

import io;

app (file o) compute(int i)
{
  "./compute.sh" i o;
}

printf("Running loop...");
foreach i in [1:9]
{
  file f<"f-%i.txt"%i> = compute(i);
}
