Base.convert(::Type{Nanoseconds}, x::Microseconds) =
    Nanoseconds(value(x) * NANOSECONDS_PER_MICROSECOND)
Base.convert(::Type{Nanoseconds}, x::Milliseconds) =
    Nanoseconds(value(x) * NANOSECONDS_PER_MILLISECOND)
Base.convert(::Type{Nanoseconds}, x::Seconds) =
    Nanoseconds(value(x) * NANOSECONDS_PER_SECOND)
Base.convert(::Type{Nanoseconds}, x::Minutes) =
    Nanoseconds(value(x) * NANOSECONDS_PER_MINUTE)
Base.convert(::Type{Nanoseconds}, x::Hours) =
    Nanoseconds(value(x) * NANOSECONDS_PER_HOUR)
Base.convert(::Type{Nanoseconds}, x::Days) =
    Nanoseconds(value(x) * NANOSECONDS_PER_DAY)
Base.convert(::Type{Nanoseconds}, x::Weeks) =
    Nanoseconds(value(x) * NANOSECONDS_PER_WEEK)
Base.convert(::Type{Microseconds}, x::Milliseconds) =
    Microseconds(value(x) * MICROSECONDS_PER_MILLISECOND)
Base.convert(::Type{Microseconds}, x::Seconds) =
    Microseconds(value(x) * MICROSECONDS_PER_SECOND)
Base.convert(::Type{Microseconds}, x::Minutes) =
    Microseconds(value(x) * MICROSECONDS_PER_MINUTE)
Base.convert(::Type{Microseconds}, x::Hours) =
    Microseconds(value(x) * MICROSECONDS_PER_HOUR)
Base.convert(::Type{Microseconds}, x::Days) =
    Microseconds(value(x) * MICROSECONDS_PER_DAY)
Base.convert(::Type{Microseconds}, x::Weeks) =
    Microseconds(value(x) * MICROSECONDS_PER_WEEK)
Base.convert(::Type{Milliseconds}, x::Seconds) =
    Milliseconds(value(x) * MILLISECONDS_PER_SECOND)
Base.convert(::Type{Milliseconds}, x::Minutes) =
    Milliseconds(value(x) * MILLISECONDS_PER_MINUTE)
Base.convert(::Type{Milliseconds}, x::Hours) =
    Milliseconds(value(x) * MILLISECONDS_PER_HOUR)
Base.convert(::Type{Milliseconds}, x::Days) =
    Milliseconds(value(x) * MILLISECONDS_PER_DAY)
Base.convert(::Type{Milliseconds}, x::Weeks) =
    Milliseconds(value(x) * MILLISECONDS_PER_WEEK)
Base.convert(::Type{Seconds}, x::Minutes) =
    Seconds(value(x) * SECONDS_PER_MINUTE)
Base.convert(::Type{Seconds}, x::Hours) =
    Seconds(value(x) * SECONDS_PER_HOUR)
Base.convert(::Type{Seconds}, x::Days) =
    Seconds(value(x) * SECONDS_PER_DAY)
Base.convert(::Type{Seconds}, x::Weeks) =
    Seconds(value(x) * SECONDS_PER_WEEK)
Base.convert(::Type{Minutes}, x::Hours) =
    Minutes(value(x) * MINUTES_PER_HOUR)
Base.convert(::Type{Minutes}, x::Days) =
    Minutes(value(x) * MINUTES_PER_DAY)
Base.convert(::Type{Minutes}, x::Weeks) =
    Minutes(value(x) * MINUTES_PER_WEEK)
Base.convert(::Type{Hours}, x::Days) =
    Hours(value(x) * HOURS_PER_DAY)
Base.convert(::Type{Hours}, x::Weeks) =
    Hours(value(x) * HOURS_PER_WEEK)
Base.convert(::Type{Days}, x::Weeks) =
    Days(value(x) * DAYS_PER_WEEK)
Base.convert(::Type{Months}, x::Quarters) =
    Months(value(x) * MONTHS_PER_QUARTER)
Base.convert(::Type{Months}, x::Years) =
    Months(value(x) * MONTHS_PER_YEAR)
Base.convert(::Type{Quarters}, x::Years) =
    Quarters(value(x) * QUARTERS_PER_YEAR)

Base.promote_rule(::Type{Nanoseconds}, ::Type{Microseconds}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Milliseconds}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Seconds}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Minutes}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Hours}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Days}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Weeks}) = Nanoseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Milliseconds}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Seconds}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Minutes}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Hours}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Days}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Weeks}) = Micrseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Seconds}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Minutes}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Hours}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Days}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Weeks}) = Milliseconds
Base.promote_rule(::Type{Seconds}, ::Type{Minutes}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{Hours}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{Days}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{Weeks}) = Seconds
Base.promote_rule(::Type{Minutes}, ::Type{Hours}) = Minutes
Base.promote_rule(::Type{Minutes}, ::Type{Days}) = Minutes
Base.promote_rule(::Type{Minutes}, ::Type{Weeks}) = Minutes
Base.promote_rule(::Type{Hours}, ::Type{Days}) = Hours
Base.promote_rule(::Type{Hours}, ::Type{Weeks}) = Hours
Base.promote_rule(::Type{Days}, ::Type{Weeks}) = Days
Base.promote_rule(::Type{Months}, ::Type{Quarters}) = Months
Base.promote_rule(::Type{Months}, ::Type{Years}) = Months
Base.promote_rule(::Type{Quarters}, ::Type{Years}) = Quarters
