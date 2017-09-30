
"""
    UTM_plusthis_LCL()
	
This gives the time difference to be applied
to UTM when deriving local time.

   local_time = univ_time + UTM_plusths_LCL()
"""
function UTM_plusthis_LCL()
   raw_millisecs = (now() - now(Base.Dates.UTC)).value
   halfway = copysign(30_000, raw_millisecs)
   raw_millisecs += halfway
   raw_minutes = div(raw_millisecs, 60_000)
   return Minutes( raw_minutes )
end


const UTM2LCL = [ Span(UTM_plusthis_LCL()) ]

function refresh_universal_to_local()
    UTM2LCL[1] = Span(UTM_plusthis_LCL())
end
