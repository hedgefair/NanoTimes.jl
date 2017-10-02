#months(x::TimeSpan) = months(x)
quarters(x::TimeSpan) = div(months(x), MONTHS_PER_QUARTER)
years(x::TimeSpan) = div(months(x), MONTHS_PER_YEAR)
decades(x::TimeSpan) = div(months(x), MONTHS_PER_DECADE)
centuries(x::TimeSpan) = div(months(x), MONTHS_PER_CENTURY)

month(x::TimeSpan) = months(x) - (years(x) * MONTHS_PER_YEAR)
quarter(x::TimeSpan) = quarters(x) - (years(x) * QUARTERS_PER_YEAR)
year(x::TimeSpan) = years(x)
decade(x::TimeSpan) = decades(x) - (centuries(x) * DECADES_PER_CENTURY)
century(x::TimeSpan) = centuries(x)

Months(x::TimeSpan) = Months(months(x))
Quarters(x::TimeSpan) = Quarters(quarters(x))
Years(x::TimeSpan) = Years(years(x))
Decades(x::TimeSpan) = Decades(decades(x))
Centuries(x::TimeSpan) = Centuries(centuries(x))
Month(x::TimeSpan) = Months(month(x))
Quarter(x::TimeSpan) = Quarters(quarter(x))
Year(x::TimeSpan) = Years(year(x))


#nanoseconds(x::TimeSpan) = nanoseconds(x)
microseconds(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_MICROSECOND)
milliseconds(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_MILLISECOND)
seconds(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_SECOND)
minutes(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_MINUTE)
quarterhours(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_QUARTERHOUR)
hours(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_HOUR)
days(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_DAY)
weeks(x::TimeSpan) = div(nanoseconds(x), NANOSECONDS_PER_WEEK)

nanosecond(x::TimeSpan) = nanoseconds(x) - (microseconds(x) * NANOSECONDS_PER_MICROSECOND)
microsecond(x::TimeSpan) = microseconds(x) - (milliseconds(x) * MICROSECONDS_PER_MILLISECOND)
millisecond(x::TimeSpan) = milliseconds(x) - (seconds(x) * MILLISECONDS_PER_SECOND)
second(x::TimeSpan) = seconds(x) - (minutes(x) * SECONDS_PER_MINUTE)
minute(x::TimeSpan) = minutes(x) - (hours(x) * MINUTES_PER_HOUR)
quarterhour(x::TimeSpan) = quarterhours(x) - (hours(x) * MINUTES_PER_HOUR)
hour(x::TimeSpan) = hours(x) - (days(x) * HOURS_PER_DAY)
day(x::TimeSpan) = days(x)
week(x::TimeSpan) = weeks(x)

Nanosecond(x::TimeSpan) = Nanoseconds(nanosecond(x))
Microsecond(x::TimeSpan) = Microseconds(microsecond(x))
Millisecond(x::TimeSpan) = Milliseconds(millisecond(x))
Second(x::TimeSpan) = Seconds(second(x))
Minute(x::TimeSpan) = Minutes(minute(x))
QuarterHour(x::TimeSpan) = QuarterHours(quarterhour(x))
Hour(x::TimeSpan) = Hours(hour(x))
Day(x::TimeSpan) = Days(day(x))
Week(x::TimeSpan) = Weeks(week(x))

Nanoseconds(x::TimeSpan) = Nanoseconds(nanoseconds(x))
Microseconds(x::TimeSpan) = Microseconds(microseconds(x))
Milliseconds(x::TimeSpan) = Milliseconds(milliseconds(x))
Seconds(x::TimeSpan) = Seconds(seconds(x))
Minutes(x::TimeSpan) = Minutes(minutes(x))
QuarterHours(x::TimeSpan) = QuarterHours(quarterhours(x))
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

Base.:(+)(x::TimeSpan, y::Years) =
    TimeSpan(nanoseconds(x), months(x) + (years(y) * MONTHS_PER_YEAR))
Base.:(+)(x::TimeSpan, y::Months) =
    TimeSpan(nanoseconds(x), months(x) + months(y))
Base.:(+)(x::TimeSpan, y::Weeks) =
    TimeSpan(nanoseconds(x) + (weeks(y) * NANOSECONDS_PER_WEEK), months(x))
Base.:(+)(x::TimeSpan, y::Days) =
    TimeSpan(nanoseconds(x) + (days(y) * NANOSECONDS_PER_DAY), months(x))
Base.:(+)(x::TimeSpan, y::Hours) =
    TimeSpan(nanoseconds(x) + (hours(y) * NANOSECONDS_PER_HOUR), months(x))
Base.:(+)(x::TimeSpan, y::Minutes) =
    TimeSpan(nanoseconds(x) + (minutes(y) * NANOSECONDS_PER_MINUTE), months(x))
Base.:(+)(x::TimeSpan, y::Seconds) =
    TimeSpan(nanoseconds(x) + (seconds(y) * NANOSECONDS_PER_SECOND), months(x))
Base.:(+)(x::TimeSpan, y::Milliseconds) =
    TimeSpan(nanoseconds(x) + (milliseconds(y) * NANOSECONDS_PER_MILLISECOND), months(x))
Base.:(+)(x::TimeSpan, y::Microseconds) =
    TimeSpan(nanoseconds(x) + (microseconds(y) * NANOSECONDS_PER_MICROSECOND), months(x))
Base.:(+)(x::TimeSpan, y::Nanoseconds) =
    TimeSpan(nanoseconds(x) + nanoseconds(y), months(x))


Base.:(+)(x::Years, y::TimeSpan) = y + x
Base.:(+)(x::Months, y::TimeSpan) = y + x
Base.:(+)(x::Weeks, y::TimeSpan) = y + x
Base.:(+)(x::Days, y::TimeSpan) = y + x
Base.:(+)(x::Hours, y::TimeSpan) = y + x
Base.:(+)(x::Minutes, y::TimeSpan) = y + x
Base.:(+)(x::Seconds, y::TimeSpan) = y + x
Base.:(+)(x::Milliseconds, y::TimeSpan) = y + x
Base.:(+)(x::Microseconds, y::TimeSpan) = y + x
Base.:(+)(x::Nanoseconds, y::TimeSpan) = y + x

Base.:(-)(x::TimeSpan, y::Years) =
    TimeSpan(nanoseconds(x), months(x) - (years(y) * MONTHS_PER_YEAR))
Base.:(-)(x::TimeSpan, y::Months) =
    TimeSpan(nanoseconds(x), months(x) - months(y))
Base.:(-)(x::TimeSpan, y::Weeks) =
    TimeSpan(nanoseconds(x) - (weeks(y) * NANOSECONDS_PER_WEEK), months(x))
Base.:(-)(x::TimeSpan, y::Days) =
    TimeSpan(nanoseconds(x) - (days(y) * NANOSECONDS_PER_DAY), months(x))
Base.:(-)(x::TimeSpan, y::Hours) =
    TimeSpan(nanoseconds(x) - (hours(y) * NANOSECONDS_PER_HOUR), months(x))
Base.:(-)(x::TimeSpan, y::Minutes) =
    TimeSpan(nanoseconds(x) - (minutes(y) * NANOSECONDS_PER_MINUTE), months(x))
Base.:(-)(x::TimeSpan, y::Seconds) =
    TimeSpan(nanoseconds(x) - (seconds(y) * NANOSECONDS_PER_SECOND), months(x))
Base.:(-)(x::TimeSpan, y::Milliseconds) =
    TimeSpan(nanoseconds(x) - (milliseconds(y) * NANOSECONDS_PER_MILLISECOND), months(x))
Base.:(-)(x::TimeSpan, y::Microseconds) =
    TimeSpan(nanoseconds(x) - (microseconds(y) * NANOSECONDS_PER_MICROSECOND), months(x))
Base.:(-)(x::TimeSpan, y::Nanoseconds) =
    TimeSpan(nanoseconds(x) - nanoseconds(y), months(x))

Base.:(-)(x::Years, y::TimeSpan) = TimeSpan(x) - y
Base.:(-)(x::Months, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Weeks, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Days, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Hours, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Minutes, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Seconds, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Milliseconds, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Microseconds, y::TimeSpan) = TimeSpan(x) + x
Base.:(-)(x::Nanoseconds, y::TimeSpan) = TimeSpan(x) + x
