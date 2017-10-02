
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

"""
     UTMoffset()

@example

    julia> UTMoffset()
    NanoTimes.Minutes(-240)

"""
function UTMoffset()
	utm = UnivTime()
	lcl = LocalTime(utm)
	nanosecs = lcl.value - utm.value
	qrtrhours = fld(nanosecs, 900_000_000_000)
	if isodd(qrtrhours)
	    qrtrhours = cld(nanosecs, 900_000_000_000)
	end
	# multiply intx by 15 [minutes]
	# 15 * intx === intx * 16 - intx
	#           === (intx << 4) - intx
    qrtrhours = (qrtrhours << 4) - qrtrhours
	return Minutes( qrtrhours )
end

function UTMoffset(units::T) where T<:NanoTimes.SecondBased
    minutes = UTMoffset()
    if units === Seconds
        return Seconds(value(minutes) * SECONDS_PER_MINUTE)
    elseif units === Minutes
        return minutes
    elseif units === Hours
		return Hours( round(Int64, value(minutes)/MINUTES_PER_HOUR) )
    else
	    return QrtrHours(div(value(minutes), MINUTES_PER_QRTRHOUR))
    end
end
