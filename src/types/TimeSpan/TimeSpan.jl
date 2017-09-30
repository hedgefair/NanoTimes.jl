struct TimeSpan <: AbstractTimeSpan
    nanos::IntSpan
	months::IntSpan
end
@inline nanoseconds(x::TimeSpan) = x.nanos
@inline months(x::TimeSpan) = x.months

TimeSpan(x::Span) = TimeSpan(value(x), zero(IntSpan))
TimeSpan(x::T) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x), zero(IntSpan))
TimeSpan(x::T) where T<:MonthBased =
    TimeSpan(zero(IntSpan), months(x))

Base.:(-)(x::TimeSpan) =
    TimeSpan(-nanoseconds(x), -months(x))
Base.abs(x::TimeSpan) =
    if signbit(months(x)) == signbit(nanoseconds(x))
	    TimeSpan(abs(nanoseconds(x)), abs(months(x)))
	elseif signbit(months(x))
	    TimeSpan(-nanoseconds(x), abs(months(x)))
	else
	    x
	end
	
Base.:(+)(x::TimeSpan, y::TimeSpan) =
    TimeSpan(nanoseconds(x)+nanoseconds(y),
	         months(x)+months(y))
Base.:(-)(x::TimeSpan, y::TimeSpan) =
    TimeSpan(nanoseconds(x)-nanoseconds(y),
	         months(x)-months(y))

Base.:(+)(x::T1, y::T2) where T1<:NanosecondBased where T2<:MonthBased =
    TimeSpan(nanoseconds(x), months(y))
Base.:(+)(x::T2, y::T1) where T1<:NanosecondBased where T2<:MonthBased =
    TimeSpan(nanoseconds(y), months(x))
Base.:(-)(x::T1, y::T2) where T1<:NanosecondBased where T2<:MonthBased =
    TimeSpan(nanoseconds(x), -months(y))
Base.:(-)(x::T2, y::T1) where T1<:NanosecondBased where T2<:MonthBased =
    TimeSpan(-nanoseconds(y), months(x))

Base.:(+)(x::T1, y::T2) where T1<:MonthBased where T2<:MonthBased =
    TimeSpan(zero(IntSpan), months(x) + months(y))
Base.:(-)(x::T1, y::T2) where T1<:MonthBased where T2<:MonthBased =
    TimeSpan(zero(IntSpan), months(x) - months(y))
Base.:(+)(x::T1, y::T2) where T1<:NanosecondBased where T2<:NanosecondBased =
    Span(nanoseconds(x) + nanoseconds(y))
Base.:(-)(x::T1, y::T2) where T1<:NanosecondBased where T2<:NanosecondBased =
    Span(nanoseconds(x) - nanoseconds(y))

Base.:(+)(x::Span, y::T) where T<:NanosecondBased =
    Span(nanoseconds(x) + nanoseconds(y))
Base.:(-)(x::Span, y::T) where T<:NanosecondBased =
    Span(nanoseconds(x) - nanoseconds(y))
Base.:(+)(x::Span, y::T) where T<:MonthBased =
    TimeSpan(nanoseconds(x), months(y))
Base.:(-)(x::Span, y::T) where T<:MonthBased =
    TimeSpan(nanoseconds(x), -months(y))

Base.:(+)(x::TimeSpan, y::T) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x)+nanoseconds(y), months(x))
Base.:(-)(x::TimeSpan, y::T) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x)-nanoseconds(y), months(x))
Base.:(+)(x::TimeSpan, y::T) where T<:MonthBased =
    TimeSpan(nanoseconds(x), months(x)+months(y))
Base.:(-)(x::TimeSpan, y::T) where T<:MonthBased =
    TimeSpan(nanoseconds(x), months(x)-months(y))
Base.:(+)(x::T, y::TimeSpan) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x)+nanoseconds(y), months(y))
Base.:(-)(x::T, y::TimeSpan) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x)-nanoseconds(y), months(y))
Base.:(+)(x::T, y::TimeSpan) where T<:MonthBased =
    TimeSpan(nanoseconds(y), months(x)+months(y))
Base.:(-)(x::T, y::TimeSpan) where T<:MonthBased =
    TimeSpan(nanoseconds(y), months(x)-months(y))

Base.:(*)(x::TimeSpan, y::I) where I<:Union{Int64, Int32} =
    TimeSpan(nanoseconds(x) * y,
	         months(x) * y)
Base.:(*)(x::I, y::TimeSpan) where I<:Union{Int64, Int32} =
    TimeSpan(x * nanoseconds(y),
	         x * months(y))

quarters(x::TimeSpan) = div(months(x), MONTHS_PER_QUARTER)
years(x::TimeSpan) = div(months(x), MONTHS_PER_YEAR)
month(x::TimeSpan) = months(x) - (years(x) * MONTHS_PER_YEAR)
quarter(x::TimeSpan) = quarters(x) - (years(x) * QUARTERS_PER_YEAR)
year(x::TimeSpan) = years(x)

Months(x::TimeSpan) = Months(months(x))
Quarters(x::TimeSpan) = Quarters(quarters(x))
Years(x::TimeSpan) = Years(years(x))
Month(x::TimeSpan) = Months(month(x))
Quarter(x::TimeSpan) = Quarters(quarter(x))
Year(x::TimeSpan) = Years(year(x))

microseconds(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_MICROSECOND)
milliseconds(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_MILLISECOND)
seconds(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_SECOND)
minutes(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_MINUTE)
hours(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_HOUR)
days(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_DAY)
weeks(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_WEEK)

nanosecond(x::TimeSpan) = nanoseconds(x) - (microseconds(x) * NANOSECONDS_PER_MICROSECOND)
microsecond(x::TimeSpan) = microseconds(x) - (milliseconds(x) * MICROSECONDS_PER_MILLISECOND)
millisecond(x::TimeSpan) = milliseconds(x) - (seconds(x) * MILLISECONDS_PER_SECOND)
second(x::TimeSpan) = seconds(x) - (minutes(x) * SECONDS_PER_MINUTE)
minute(x::TimeSpan) = minutes(x) - (hours(x) * MINUTES_PER_HOUR)
hour(x::TimeSpan) = hours(x) - (days(x) * HOURS_PER_DAY)
day(x::TimeSpan) = days(x)
week(x::TimeSpan) = weeks(x)

Nanosecond(x::TimeSpan) = Nanoseconds(nanosecond(x))
Microsecond(x::TimeSpan) = Microseconds(microsecond(x))
Millisecond(x::TimeSpan) = Milliseconds(millisecond(x))
Second(x::TimeSpan) = Seconds(second(x))
Minute(x::TimeSpan) = Minutes(minute(x))
Hour(x::TimeSpan) = Hours(hour(x))
Day(x::TimeSpan) = Days(day(x))
Week(x::TimeSpan) = Weeks(week(x))

Nanoseconds(x::TimeSpan) = Nanoseconds(nanoseconds(x))
Microseconds(x::TimeSpan) = Microseconds(microseconds(x))
Milliseconds(x::TimeSpan) = Milliseconds(milliseconds(x))
Seconds(x::TimeSpan) = Seconds(seconds(x))
Minutes(x::TimeSpan) = Minutes(minutes(x))
Hours(x::TimeSpan) = Hours(hours(x))
Days(x::TimeSpan) = Days(days(x))
Weeks(x::TimeSpan) = Weeks(weeks(x))
