select PeakName, RiverName,LOWER(left(PeakName,len(PeakName)-1)+RiverName) as Mix
from Peaks, Rivers
where right(PeakName,1)=LEFT(RiverName,1)
order by Mix
