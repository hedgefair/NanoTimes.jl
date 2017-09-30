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


Base.:(+)(x::TimeSpan, y::Base.Dates.Year) =
    TimeSpan(nanoseconds(x), months(x) + (Base.Dates.year(y) * MONTHS_PER_YEAR))
Base.:(+)(x::TimeSpan, y::Base.Dates.Month) =
    TimeSpan(nanoseconds(x), months(x) + Base.Dates.month(y))
Base.:(+)(x::TimeSpan, y::Base.Dates.Week) =
    TimeSpan(nanoseconds(x) + (Base.Dates.week(y) * NANOSECONDS_PER_WEEK), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Day) =
    TimeSpan(nanoseconds(x) + (Base.Dates.day(y) * NANOSECONDS_PER_DAY), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Hour) =
    TimeSpan(nanoseconds(x) + (Base.Dates.hour(y) * NANOSECONDS_PER_HOUR), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Minute) =
    TimeSpan(nanoseconds(x) + (Base.Dates.minute(y) * NANOSECONDS_PER_MINUTE), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Second) =
    TimeSpan(nanoseconds(x) + (Base.Dates.second(y) * NANOSECONDS_PER_SECOND), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Millisecond) =
    TimeSpan(nanoseconds(x) + (Base.Dates.millisecond(y) * NANOSECONDS_PER_MILLISECOND), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Microsecond) =
    TimeSpan(nanoseconds(x) + (Base.Dates.microsecond(y) * NANOSECONDS_PER_MICROSECOND), months(x))
Base.:(+)(x::TimeSpan, y::Base.Dates.Nanosecond) =
    TimeSpan(nanoseconds(x) + Base.Dates.nanosecond(y), months(x))

Base.:(-)(x::TimeSpan, y::Base.Dates.Year) =
    TimeSpan(nanoseconds(x), months(x) - (Base.Dates.year(y) * MONTHS_PER_YEAR))
Base.:(-)(x::TimeSpan, y::Base.Dates.Month) =
    TimeSpan(nanoseconds(x), months(x) - Base.Dates.month(y))
Base.:(-)(x::TimeSpan, y::Base.Dates.Week) =
    TimeSpan(nanoseconds(x) - (Base.Dates.week(y) * NANOSECONDS_PER_WEEK), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Day) =
    TimeSpan(nanoseconds(x) - (Base.Dates.day(y) * NANOSECONDS_PER_DAY), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Hour) =
    TimeSpan(nanoseconds(x) - (Base.Dates.hour(y) * NANOSECONDS_PER_HOUR), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Minute) =
    TimeSpan(nanoseconds(x) - (Base.Dates.minute(y) * NANOSECONDS_PER_MINUTE), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Second) =
    TimeSpan(nanoseconds(x) - (Base.Dates.second(y) * NANOSECONDS_PER_SECOND), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Millisecond) =
    TimeSpan(nanoseconds(x) - (Base.Dates.millisecond(y) * NANOSECONDS_PER_MILLISECOND), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Microsecond) =
    TimeSpan(nanoseconds(x) - (Base.Dates.microsecond(y) * NANOSECONDS_PER_MICROSECOND), months(x))
Base.:(-)(x::TimeSpan, y::Base.Dates.Nanosecond) =
    TimeSpan(nanoseconds(x) - Base.Dates.nanosecond(y), months(x))

