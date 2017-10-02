@inline nanoseconds(x::Week) = Base.Dates.value(x) * NANOSECONDS_PER_WEEK
@inline nanoseconds(x::Day) = Base.Dates.value(x) * NANOSECONDS_PER_DAY
@inline nanoseconds(x::Hour) = Base.Dates.value(x) * NANOSECONDS_PER_HOUR
@inline nanoseconds(x::Minute) = Base.Dates.value(x) * NANOSECONDS_PER_MINUTE
@inline nanoseconds(x::Second) = Base.Dates.value(x) * NANOSECONDS_PER_SECOND
@inline nanoseconds(x::Millisecond) = Base.Dates.value(x) * NANOSECONDS_PER_MILLISECOND
@inline nanoseconds(x::Microsecond) = Base.Dates.value(x) * NANOSECONDS_PER_MICROSECOND
@inline nanoseconds(x::Nanosecond)  = Base.Dates.value(x)

@inline microseconds(x::Week) = Base.Dates.value(x) * MICROSECONDS_PER_WEEK
@inline microseconds(x::Day) = Base.Dates.value(x) * MICROSECONDS_PER_DAY
@inline microseconds(x::Hour) = Base.Dates.value(x) * MICROSECONDS_PER_HOUR
@inline microseconds(x::Minute) = Base.Dates.value(x) * MICROSECONDS_PER_MINUTE
@inline microseconds(x::Second) = Base.Dates.value(x) * MICROSECONDS_PER_SECOND
@inline microseconds(x::Millisecond) = Base.Dates.value(x) * MICROSECONDS_PER_MILLISECOND
@inline microseconds(x::Microsecond) = Base.Dates.value(x)
@inline microseconds(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_MICROSECOND)

@inline milliseconds(x::Week) = Base.Dates.value(x) * MILLISECONDS_PER_WEEK
@inline milliseconds(x::Day) = Base.Dates.value(x) * MILLISECONDS_PER_DAY
@inline milliseconds(x::Hour) = Base.Dates.value(x) * MILLISECONDS_PER_HOUR
@inline milliseconds(x::Minute) = Base.Dates.value(x) * MILLISECONDS_PER_MINUTE
@inline milliseconds(x::Second) = Base.Dates.value(x) * MILLISECONDS_PER_SECOND
@inline milliseconds(x::Millisecond) = Base.Dates.value(x)
@inline milliseconds(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_MILLISECOND)
@inline milliseconds(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_MILLISECOND)

@inline seconds(x::Week) = Base.Dates.value(x) * SECONDS_PER_WEEK
@inline seconds(x::Day) = Base.Dates.value(x) * SECONDS_PER_DAY
@inline seconds(x::Hour) = Base.Dates.value(x) * SECONDS_PER_HOUR
@inline seconds(x::Minute) = Base.Dates.value(x) * SECONDS_PER_MINUTE
@inline seconds(x::Second) = Base.Dates.value(x)
@inline seconds(x::Millisecond) = div(Base.Dates.value(x), MILLISECONDS_PER_SECOND)
@inline seconds(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_SECOND)
@inline seconds(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_SECOND)

@inline minutes(x::Week) = Base.Dates.value(x) * MINUTES_PER_WEEK
@inline minutes(x::Day) = Base.Dates.value(x) * MINUTES_PER_DAY
@inline minutes(x::Hour) = Base.Dates.value(x) * MINUTES_PER_HOUR
@inline minutes(x::Minute) = Base.Dates.value(x)
@inline minutes(x::Second) = div(Base.Dates.value(x), SECONDS_PER_MINUTE)
@inline minutes(x::Millisecond) = div(Base.Dates.value(x), MILLISECONDS_PER_MINUTE)
@inline minutes(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_MINUTE)
@inline minutes(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_MINUTE)

@inline quarterhours(x::Week) = Base.Dates.value(x) * QUARTERHOURS_PER_WEEK
@inline quarterhours(x::Day) = Base.Dates.value(x) * QUARTERHOURS_PER_DAY
@inline quarterhours(x::Hour) = Base.Dates.value(x)
@inline quarterhours(x::Minute) = div(Base.Dates.value(x), MINUTES_PER_QUARTERHOUR)
@inline quarterhours(x::Second) = div(Base.Dates.value(x), SECONDS_PER_QUARTERHOUR)
@inline quarterhours(x::Millisecond) = div(Base.Dates.value(x), MILLISECONDS_PER_QUARTERHOUR)
@inline quarterhours(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_QUARTERHOUR)
@inline quarterhours(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_QUARTERHOUR)

@inline hours(x::Week) = Base.Dates.value(x) * HOURS_PER_WEEK
@inline hours(x::Day) = Base.Dates.value(x) * HOURS_PER_DAY
@inline hours(x::Hour) = Base.Dates.value(x)
@inline hours(x::Minute) = div(Base.Dates.value(x), MINUTES_PER_HOUR)
@inline hours(x::Second) = div(Base.Dates.value(x), SECONDS_PER_HOUR)
@inline hours(x::Millisecond) = div(Base.Dates.value(x), MILLISECONDS_PER_HOUR)
@inline hours(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_HOUR)
@inline hours(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_HOUR)

@inline days(x::Week) = Base.Dates.value(x) * DAYS_PER_WEEK
@inline days(x::Day) = Base.Dates.value(x)
@inline days(x::Hour) = div(Base.Dates.value(x), HOURS_PER_DAY)
@inline days(x::Minute) = div(Base.Dates.value(x), MINUTES_PER_DAY)
@inline days(x::Second) = div(Base.Dates.value(x), SECONDS_PER_DAY)
@inline days(x::Millisecond) = div(Base.Dates.value(x), MILLISECONDS_PER_DAY)
@inline days(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_DAY)
@inline days(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_DAY)

@inline weeks(x::Week) = Base.Dates.value(x)
@inline weeks(x::Day) = div(Base.Dates.value(x), MINUTES_PER_WEEK)
@inline weeks(x::Hour) = div(Base.Dates.value(x), MINUTES_PER_WEEK)
@inline weeks(x::Minute) = div(Base.Dates.value(x), MINUTES_PER_WEEK)
@inline weeks(x::Second) = div(Base.Dates.value(x), SECONDS_PER_WEEK)
@inline weeks(x::Millisecond) = div(Base.Dates.value(x), MILLISECONDS_PER_WEEK)
@inline weeks(x::Microsecond) = div(Base.Dates.value(x), MICROSECONDS_PER_WEEK)
@inline weeks(x::Nanosecond)  = div(Base.Dates.value(x), NANOSECONDS_PER_WEEK)

@inline months(x::Month) = Base.Dates.value(x)
@inline months(x::Year) = Base.Dates.value(x) * MONTHS_PER_YEAR
@inline quarters(x::Month) = div(Base.Dates.value(x), MONTHS_PER_QUARTER)
@inline quarters(x::Year) = Base.Dates.value(x) * QUARTERS_PER_YEAR
@inline years(x::Month) = div(Base.Dates.value(x), MONTHS_PER_YEAR)
@inline years(x::Year) = Base.Dates.value(x)


@inline nanoseconds(x::Weeks) = value(x) * NANOSECONDS_PER_WEEK
@inline nanoseconds(x::Days) = value(x) * NANOSECONDS_PER_DAY
@inline nanoseconds(x::Hours) = value(x) * NANOSECONDS_PER_HOUR
@inline nanoseconds(x::Minutes) = value(x) * NANOSECONDS_PER_MINUTE
@inline nanoseconds(x::Seconds) = value(x) * NANOSECONDS_PER_SECOND
@inline nanoseconds(x::Milliseconds) = value(x) * NANOSECONDS_PER_MILLISECOND
@inline nanoseconds(x::Microseconds) = value(x) * NANOSECONDS_PER_MICROSECOND
@inline nanoseconds(x::Nanoseconds) = value(x)

@inline microseconds(x::Weeks) = value(x) * MICROSECONDS_PER_WEEK
@inline microseconds(x::Days) = value(x) * MICROSECONDS_PER_DAY
@inline microseconds(x::Hours) = value(x) * MICROSECONDS_PER_HOUR
@inline microseconds(x::Minutes) = value(x) * MICROSECONDS_PER_MINUTE
@inline microseconds(x::Seconds) = value(x) * MICROSECONDS_PER_SECOND
@inline microseconds(x::Milliseconds) = value(x) * MICROSECONDS_PER_MILLISECOND
@inline microseconds(x::Microseconds) = value(x)
@inline microseconds(x::Nanoseconds) = div(value(x), NANOSECONDS_PER_MICROSECOND)

@inline milliseconds(x::Weeks) = value(x) * MILLISECONDS_PER_WEEK
@inline milliseconds(x::Days) = value(x) * MILLISECONDS_PER_DAY
@inline milliseconds(x::Hours) = value(x) * MILLISECONDS_PER_HOUR
@inline milliseconds(x::Minutes) = value(x) * MILLISECONDS_PER_MINUTE
@inline milliseconds(x::Seconds) = value(x) * MILLISECONDS_PER_SECOND
@inline milliseconds(x::Milliseconds) = value(x)
@inline milliseconds(x::Microseconds) = div(value(x), MICROSECONDS_PER_MILLISECOND)
@inline milliseconds(x::Nanoseconds)  = div(value(x), NANOSECONDS_PER_MILLISECOND)

@inline seconds(x::Weeks) = value(x) * SECONDS_PER_WEEK
@inline seconds(x::Days) = value(x) * SECONDS_PER_DAY
@inline seconds(x::Hours) = value(x) * SECONDS_PER_HOUR
@inline seconds(x::Minutes) = value(x) * SECONDS_PER_MINUTE
@inline seconds(x::Seconds) = value(x)
@inline seconds(x::Milliseconds) = div(value(x), MILLISECONDS_PER_SECOND)
@inline seconds(x::Microseconds) = div(value(x), MICROSECONDS_PER_SECOND)
@inline seconds(x::Nanoseconds) = div(value(x), NANOSECONDS_PER_SECOND)

@inline minutes(x::Weeks) = value(x) * MINUTES_PER_WEEK
@inline minutes(x::Days) = value(x) * MINUTES_PER_DAY
@inline minutes(x::Hours) = value(x) * MINUTES_PER_HOUR
@inline minutes(x::Minutes) = value(x)
@inline minutes(x::Seconds) = div(value(x), SECONDS_PER_MINUTE)
@inline minutes(x::Milliseconds) = div(value(x), MILLISECONDS_PER_MINUTE)
@inline minutes(x::Microseconds) = div(value(x), MICROSECONDS_PER_MINUTE)
@inline minutes(x::Nanoseconds)  = div(value(x), NANOSECONDS_PER_MINUTE)

@inline quarterhours(x::Weeks) = value(x) * QUARTERHOURS_PER_WEEK
@inline quarterhours(x::Days) = value(x) * QUARTERHOURS_PER_DAY
@inline quarterhours(x::Hours) = value(x)
@inline quarterhours(x::Minutes) = div(value(x), MINUTES_PER_QUARTERHOUR)
@inline quarterhours(x::Seconds) = div(value(x), SECONDS_PER_QUARTERHOUR)
@inline quarterhours(x::Milliseconds) = div(value(x), MILLISECONDS_PER_QUARTERHOUR)
@inline quarterhours(x::Microseconds) = div(value(x), MICROSECONDS_PER_QUARTERHOUR)
@inline quarterhours(x::Nanoseconds)  = div(value(x), NANOSECONDS_PER_QUARTERHOUR)

@inline hours(x::Weeks) = value(x) * HOURS_PER_WEEK
@inline hours(x::Days) = value(x) * HOURS_PER_DAY
@inline hours(x::Hours) = value(x)
@inline hours(x::Minutes) = div(value(x), MINUTES_PER_HOUR)
@inline hours(x::Seconds) = div(value(x), SECONDS_PER_HOUR)
@inline hours(x::Milliseconds) = div(value(x), MILLISECONDS_PER_HOUR)
@inline hours(x::Microseconds) = div(value(x), MICROSECONDS_PER_HOUR)
@inline hours(x::Nanoseconds) = div(value(x), NANOSECONDS_PER_HOUR)

@inline days(x::Weeks) = value(x) * DAYS_PER_WEEK
@inline days(x::Days) = value(x)
@inline days(x::Hours) = div(value(x), HOURS_PER_DAY)
@inline days(x::Minutes) = div(value(x), MINUTES_PER_DAY)
@inline days(x::Seconds) = div(value(x), SECONDS_PER_DAY)
@inline days(x::Milliseconds) = div(value(x), MILLISECONDS_PER_DAY)
@inline days(x::Microseconds) = div(value(x), MICROSECONDS_PER_DAY)
@inline days(x::Nanoseconds) = div(value(x), NANOSECONDS_PER_DAY)

@inline weeks(x::Weeks) = value(x)
@inline weeks(x::Days) = div(value(x), MINUTES_PER_WEEK)
@inline weeks(x::Hours) = div(value(x), MINUTES_PER_WEEK)
@inline weeks(x::Minutes) = div(value(x), MINUTES_PER_WEEK)
@inline weeks(x::Seconds) = div(value(x), SECONDS_PER_WEEK)
@inline weeks(x::Milliseconds) = div(value(x), MILLISECONDS_PER_WEEK)
@inline weeks(x::Microseconds) = div(value(x), MICROSECONDS_PER_WEEK)
@inline weeks(x::Nanoseconds) = div(value(x), NANOSECONDS_PER_WEEK)

@inline months(x::Months) = value(x)
@inline months(x::Years) = value(x) * MONTHS_PER_YEAR
@inline quarters(x::Months) = div(value(x), MONTHS_PER_QUARTER)
@inline quarters(x::Years) = value(x) * QUARTERS_PER_YEAR
@inline years(x::Months) = div(value(x), MONTHS_PER_YEAR)
@inline years(x::Years) = value(x)


for P in (:Year, :Month)
    @eval Months(x::$P) = Months(months(x))
    @eval Quarters(x::$P) = Quarters(quarters(x))
    @eval Years(x::$P) = Years(years(x))
    @eval Decades(x::$P) = Decades(decades(x))
    @eval Centuries(x::$P) = Centuries(centuries(x))
end

quarterhours(x::QuarterHours) = value(x)

Base.Dates.year(x::Base.Dates.Year) = x.value
Base.Dates.month(x::Base.Dates.Month) = x.value
Base.Dates.week(x::Base.Dates.Week) = x.value
Base.Dates.day(x::Base.Dates.Day) = x.value
Base.Dates.hour(x::Base.Dates.Hour) = x.value
Base.Dates.minute(x::Base.Dates.Minute) = x.value
Base.Dates.second(x::Base.Dates.Second) = x.value
Base.Dates.millisecond(x::Base.Dates.Millisecond) = x.value
Base.Dates.microsecond(x::Base.Dates.Microsecond) = x.value
Base.Dates.nanosecond(x::Base.Dates.Nanosecond) = x.value
