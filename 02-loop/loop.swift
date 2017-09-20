
/**
   Example 2 - LOOP.SWIFT
*/

import io;
import sys;

string SFW = getenv("SFW");
printf("SFW: %s", SFW);

app (file o) task(int i)
{
  (SFW+"/task.sh") i o;
}

printf("Running loop...");
foreach i in [1:9]
{
  file f<"f-%i.txt"%i> = task(i);
}
