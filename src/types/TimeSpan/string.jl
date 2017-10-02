function Base.string(x::TimeSpan)
    nanosecs  = nanoseconds(x)
    years_as_months = months(x)

    abs_nanos,  sgn_nanos = abs(nanosecs), signbit(nanosecs)
    abs_months, sgn_months = abs(years_as_months), signbit(years_as_months)

    if abs_months > 0
        abs_years, abs_months = fldmod(abs_months, MONTHS_PER_YEAR)
    else
        abs_years, abs_months = zero(Int64), zero(Int64)
    end
    mns_sgn = abs_months == 0 ? "" : (sgn_months ? NEGATIVE : POSITIVE)

    secs, subsecs = fldmod(abs_nanos, NANOSECONDS_PER_SECOND)
    mins, secs = fldmod(secs, SECONDS_PER_MINUTE)
    hrs, mins = fldmod(mins, MINUTES_PER_HOUR)
    dys, hrs = fldmod(hrs, HOURS_PER_DAY)

    return    Years(abs_years), Months(abs_months),
    Days(dys), Hours(hrs), Minutes(mins),
    Seconds(secs), subsecs
end
#=
    if subsecs > 999_999_999
       subsecs = round(Int64, subsecs / 10^(log10(subsecs) - 9))
    end

    millis = micros = nanos = zero(Int64)
    micros, nanos  = fldmod(subsecs, NANOSECONDS_PER_MICROSECOND)
    millis, micros = fldmod(micros, MICROSECONDS_PER_MILLISECOND)

    nanos_str  = nanos  == 0 ? "" : threedigits(nanos)
    micros_str = nanos+micros == 0 ? "" : threedigits(micros)
    millis_str = nanos+micros+millis == 0 ? "" : threedigits(millis)

    subsec_pt  = subsecs == 0 ? "" : DEC_SEP
    subsec_str = string(subsec_pt, millis_str, micros_str, nanos_str)

    dys_sgn = abs_nanos == 0 ? "" : (sgn_nanos ? NEGATIVE : POSITIVE)

    dys_str = dys == 0 ? "" : string(dys, DYHR_SEP)

    dys_str = string(dys_str, twodigits(hrs), HMS_SEP,
                    twodigits(mins), HMS_SEP,twodigits(secs))

    if abs_months > 0
       yr_str = abs_years == 0 ? "" : string(abs_years, YM_SEP)
       if  abs_months+abs_years == 0
           mn_str = ""
       elseif abs_years == 0
           mn_str = string(abs_months)
       else
           mn_str = string(abs_years, YM_SEP, twodigits(abs_months))
       end
    else
       mn_str =  ""
    end

    if (yr_str != "")
       ym_dhms_sep = "P"
    else
       ym_dhms_sep = "_"
    end

    if sgn_months == sgn_nanos
        str = string(mns_sgn,"(",mn_str,ym_dhms_sep,dys_str,")")
    else
        str = string(mns_sgn,mn_str,ym_dhms_sep,dys_sgn,dys_str)
    end

    return str
end
=#
