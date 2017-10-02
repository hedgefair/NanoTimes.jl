#=>
    This package has a few configurations available.
	
	To use universal mean times only
	   NANOTIMES_ARE_UMT = true           <=== the default
	
	To use local mean times only
	   NANOTIMES_ARE_LMT = true

     You may set your choice prior to reading this file,
	or you may set your choice in the ENV:
	
	   NANOTIMES_ARE_LMT = true
	   using NanoTimes
	
<=#

const NANOTIME_IS_UTM =	(

 if VERSION >= v"0.7.0-DEV.1816"

  const NANOTIME_IS_UTM =	
    if ((@isdefined TIMES_ARE_UMT) && TIMES_ARE_UMT) ||
       (haskey(ENV,"TIMES_ARE_UMT") && ENV["TIMES_ARE_UMT"])
         NanoTimeFrame = true
    elseif ((@isdefined TIMES_ARE_LMT) && TIMES_ARE_LMT) ||
       (haskey(ENV,"TIMES_ARE_LMT") && ENV["TIMES_ARE_LMT"])
         NanoTimeFrame = false
    else
        true
    end
	
 else

    if ((isdefined(:TIMES_ARE_UMT)) && TIMES_ARE_UMT) ||
       (haskey(ENV,"TIMES_ARE_UMT") && ENV["TIMES_ARE_UMT"])
         NanoTimeFrame = true
    elseif ((isdefined(:TIMES_ARE_LMT)) && TIMES_ARE_LMT) ||
       (haskey(ENV,"TIMES_ARE_LMT") && ENV["TIMES_ARE_LMT"])
         NanoTimeFrame = false
    else
        true
    end

 end		
)
