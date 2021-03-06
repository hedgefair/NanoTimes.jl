__precompile__()

module NanoTimes

# this module exports its own Time (aka Clock)
#   use Time24 for Base.Dates.Time

export UnivTime, LocalTime, is_univtime, is_localtime,
    Time, Span, TimeSpan,
    Clock, value,
    Date, DateTime, Time24,
    Year, Month, Week, Day,
    Hour, QuarterHour, Minute, Second,
    Millisecond, Microsecond, Nanosecond,
    year, month, week, day,
    hour, quarterhour, minute, second,
    millisecond, microsecond, nanosecond,
    Years, Quarters, Months, Weeks, Days,
    Hours, QuarterHours, Minutes, Seconds,
    Milliseconds, Microseconds, Nanoseconds,
    years, quarters, months, weeks, days,
    hours, quarterhours, minutes, seconds,
    milliseconds, microseconds, nanoseconds

import Base.Dates:Date, DateTime,
    datetime2rata, rata2datetime,
    datetime2unix, unix2datetime,
    date2epochdays, epochdays2date,
    Period, CompoundPeriod,
    Year, Month, Week, Day, Hour, Minute, Second,
    Millisecond, Microsecond, Nanosecond,
    year, month, week, day, hour, minute, second,
    millisecond, microsecond, nanosecond,
	value

const IntTime = Int64
const IntSpan = Int64

include("support/preference.jl")

include("support/chars.jl")
include("support/granular_consts.jl")
include("support/rata_conversion.jl")
include("support/string_to_smallint.jl")


include("types/Abstract.jl")
include("types/Period/Period.jl")
include("types/Clock/Clock.jl")
include("types/Clock/UnivTime.jl")
include("types/Clock/LocalTime.jl")
include("types/Clock/whichframe.jl")
include("types/Span/Span.jl")
include("types/TimeSpan/TimeSpan.jl")
include("types/TimeSpan/string.jl")
include("types/hash.jl")
include("types/type_utils.jl")


const Time = Clock
const Time24 = Base.Dates.Time

include("types/Period/convert.jl")
include("types/Period/arith.jl")
include("types/TimeSpan/periods.jl")

include("types/Clock/convert.jl")
include("types/Clock/parts.jl")
include("types/Clock/string.jl")
include("types/Clock/io.jl")
include("types/Clock/arith.jl")
include("types/Clock/parse.jl")

include("types/Span/convert.jl")
include("types/Span/parts.jl")
include("types/Span/string.jl")
include("types/Span/io.jl")
include("types/Span/arith.jl")
include("types/Span/parse.jl")

include("types/mixed/Clock_Span.jl")
include("types/mixed/arith.jl")
include("types/mixed/periods.jl")
include("types/mixed/parse.jl")

include("support/utm2local.jl")

# warm it up
#=
const DatesUTC = Base.Dates.UTC
@inline unow() = now(DatesUTC)
n = unow()
unv = UnivTime(n)
lcl = LocalTime(unv)
n = nothing; unv = nothing; lcl = nothing;
=#
end # module
