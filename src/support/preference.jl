#=>
    This package has a few configurations available.
	
	To use universal mean times only
	   NANOTIMES_ARE_UMT = true           <=== the default
	
	To use local mean times only
	   NANOTIMES_ARE_LMT = true
	
	To have both available
       NANOTIMES_ARE_BOTH = true

	You may set your choice prior to reading this file,
	or you may set your choice in the ENV:
	
	   NANOTIMES_ARE_LMT = true
	   using NanoTimes
	
       # in local environment or in .juliarc file
	   ENV[ "NANOTIMES_ARE_BOTH" ] = true
       using NanoTimes      	   
<=#

NanoTimeFrame = 0 # default is TIMES_ARE_UMT

if ((@isdefined TIMES_ARE_UMT) && TIMES_ARE_UMT) ||
   (haskey(ENV,"TIMES_ARE_UMT") && ENV["TIMES_ARE_UMT"])
   NanoTimeFrame = 0
elseif ((@isdefined TIMES_ARE_LMT) && TIMES_ARE_LMT) ||
   (haskey(ENV,"TIMES_ARE_LMT") && ENV["TIMES_ARE_LMT"])
   NanoTimeFrame = 1
elseif ((@isdefined TIMES_ARE_BOTH) && TIMES_ARE_BOTH) ||
   (haskey(ENV,"TIMES_ARE_BOTH") && ENV["TIMES_ARE_BOTH"])
   NanoTimeFrame = 2
end  

const NANOTIME_FRAME = NanoTimeFrame; NanoTimeFrame = nothing
