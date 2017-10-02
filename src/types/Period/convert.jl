Base.convert(::Type{Nanoseconds}, x::Microseconds) =
    Nanoseconds(value(x) * NANOSECONDS_PER_MICROSECOND)
Base.convert(::Type{Nanoseconds}, x::Milliseconds) =
    Nanoseconds(value(x) * NANOSECONDS_PER_MILLISECOND)
Base.convert(::Type{Nanoseconds}, x::Seconds) =
    Nanoseconds(value(x) * NANOSECONDS_PER_SECOND)
Base.convert(::Type{Nanoseconds}, x::Minutes) =
    Nanoseconds(value(x) * NANOSECONDS_PER_MINUTE)
Base.convert(::Type{Nanoseconds}, x::QuarterHours) =
    Nanoseconds(value(x) * NANOSECONDS_PER_QUARTERHOUR)
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
Base.convert(::Type{Microseconds}, x::QuarterHours) =
    Microseconds(value(x) * MICROSECONDS_PER_QUARTERHOUR)
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
Base.convert(::Type{Milliseconds}, x::QuarterHours) =
    Milliseconds(value(x) * MILLISECONDS_PER_QUARTERHOUR)
Base.convert(::Type{Milliseconds}, x::Hours) =
    Milliseconds(value(x) * MILLISECONDS_PER_HOUR)
Base.convert(::Type{Milliseconds}, x::Days) =
    Milliseconds(value(x) * MILLISECONDS_PER_DAY)
Base.convert(::Type{Milliseconds}, x::Weeks) =
    Milliseconds(value(x) * MILLISECONDS_PER_WEEK)
Base.convert(::Type{Seconds}, x::Minutes) =
    Seconds(value(x) * SECONDS_PER_MINUTE)
Base.convert(::Type{Seconds}, x::QuarterHours) =
    Seconds(value(x) * SECONDS_PER_QUARTERHOUR)
Base.convert(::Type{Seconds}, x::Hours) =
    Seconds(value(x) * SECONDS_PER_HOUR)
Base.convert(::Type{Seconds}, x::Days) =
    Seconds(value(x) * SECONDS_PER_DAY)
Base.convert(::Type{Seconds}, x::Weeks) =
    Seconds(value(x) * SECONDS_PER_WEEK)
Base.convert(::Type{Minutes}, x::Hours) =
    Minutes(value(x) * MINUTES_PER_HOUR)
Base.convert(::Type{Minutes}, x::QuarterHours) =
    Minutes(value(x) * MINUTES_PER_QUARTERHOUR)
Base.convert(::Type{Minutes}, x::Days) =
    Minutes(value(x) * MINUTES_PER_DAY)
Base.convert(::Type{Minutes}, x::Weeks) =
    Minutes(value(x) * MINUTES_PER_WEEK)
Base.convert(::Type{QuarterHours}, x::Hours) =
    QuarterHours(value(x) * QUARTERHOURS_PER_HOUR)
Base.convert(::Type{QuarterHours}, x::Days) =
    QuarterHours(value(x) * QUARTERHOURS_PER_DAY)
Base.convert(::Type{QuarterHours}, x::Weeks) =
    Hours(value(x) * QUARTERHOURS_PER_WEEK)
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
Base.promote_rule(::Type{Nanoseconds}, ::Type{QuarterHours}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Hours}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Days}) = Nanoseconds
Base.promote_rule(::Type{Nanoseconds}, ::Type{Weeks}) = Nanoseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Milliseconds}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Seconds}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Minutes}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{QuarterHours}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Hours}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Days}) = Microseconds
Base.promote_rule(::Type{Microseconds}, ::Type{Weeks}) = Micrseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Seconds}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Minutes}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{QuarterHours}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Hours}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Days}) = Milliseconds
Base.promote_rule(::Type{Milliseconds}, ::Type{Weeks}) = Milliseconds
Base.promote_rule(::Type{Seconds}, ::Type{Minutes}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{QuarterHours}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{Hours}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{Days}) = Seconds
Base.promote_rule(::Type{Seconds}, ::Type{Weeks}) = Seconds
Base.promote_rule(::Type{Minutes}, ::Type{Hours}) = Minutes
Base.promote_rule(::Type{Minutes}, ::Type{QuarterHours}) = Minutes
Base.promote_rule(::Type{Minutes}, ::Type{Days}) = Minutes
Base.promote_rule(::Type{Minutes}, ::Type{Weeks}) = Minutes
Base.promote_rule(::Type{QuarterHours}, ::Type{Hours}) = QuarterHours
Base.promote_rule(::Type{QuarterHours}, ::Type{Days}) = QuarterHours
Base.promote_rule(::Type{QuarterHours}, ::Type{Weeks}) = QuarterHours
Base.promote_rule(::Type{Hours}, ::Type{Days}) = Hours
Base.promote_rule(::Type{Hours}, ::Type{Weeks}) = Hours
Base.promote_rule(::Type{Days}, ::Type{Weeks}) = Days
Base.promote_rule(::Type{Months}, ::Type{Quarters}) = Months
Base.promote_rule(::Type{Months}, ::Type{Years}) = Months
Base.promote_rule(::Type{Quarters}, ::Type{Years}) = Quarters

Nanoseconds(x::Nanoseconds) = x
Nanoseconds(x::Microseconds) = Nanoseconds(value(x) * NANOSECONDS_PER_MICROSECOND)
Nanoseconds(x::Milliseconds) = Nanoseconds(value(x) * NANOSECONDS_PER_MILLISECOND)
Nanoseconds(x::Seconds) = Nanoseconds(value(x) * NANOSECONDS_PER_SECOND)
Nanoseconds(x::Minutes) = Nanoseconds(value(x) * NANOSECONDS_PER_MINUTE)
Nanoseconds(x::QuarterHours) = Nanoseconds(value(x) * NANOSECONDS_PER_QUARTERHOUR)
Nanoseconds(x::Hours) = Nanoseconds(value(x) * NANOSECONDS_PER_HOUR)
Nanoseconds(x::Days) = Nanoseconds(value(x) * NANOSECONDS_PER_DAY)
Nanoseconds(x::Weeks) = Nanoseconds(value(x) * NANOSECONDS_PER_WEEK)

Microseconds(x::Nanoseconds) = Microseconds(div(value(x), NANOSECONDS_PER_MICROSECOND))
Microseconds(x::Microseconds) = x
Microseconds(x::Milliseconds) = Microseconds(value(x) * MICROSECONDS_PER_MILLISECOND)
Microseconds(x::Seconds) = Microseconds(value(x) * MICROSECONDS_PER_SECOND)
Microseconds(x::Minutes) = Microseconds(value(x) * MICROSECONDS_PER_MINUTE)
Microseconds(x::QuarterHours) = Microseconds(value(x) * MICROSECONDS_PER_QUARTERHOUR)
Microseconds(x::Hours) = Microseconds(value(x) * MICROSECONDS_PER_HOUR)
Microseconds(x::Days) = Microseconds(value(x) * MICROSECONDS_PER_DAY)
Microseconds(x::Weeks) = Microseconds(value(x) * MICROSECONDS_PER_WEEK)

Milliseconds(x::Nanoseconds) = Milliseconds(div(value(x), NANOSECONDS_PER_MILLISECOND))
Milliseconds(x::Microseconds) = Milliseconds(div(value(x), MICROSECONDS_PER_MILLISECOND))
Milliseconds(x::Milliseconds) = x
Milliseconds(x::Seconds) = Milliseconds(value(x) * MILLISECONDS_PER_SECOND)
Milliseconds(x::Minutes) = Milliseconds(value(x) * MILLISECONDS_PER_MINUTE)
Milliseconds(x::QuarterHours) = Milliseconds(value(x) * MILLISECONDS_PER_QUARTERHOUR)
Milliseconds(x::Hours) = Milliseconds(value(x) * MILLISECONDS_PER_HOUR)
Milliseconds(x::Days) = Milliseconds(value(x) * MILLISECONDS_PER_DAY)
Milliseconds(x::Weeks) = Milliseconds(value(x) * MILLISECONDS_PER_WEEK)

Seconds(x::Nanoseconds)  = Seconds(div(value(x), NANOSECONDS_PER_SECOND))
Seconds(x::Microseconds) = Seconds(div(value(x), MICROSECONDS_PER_SECOND))
Seconds(x::Milliseconds) = Seconds(div(value(x), MILLISECONDS_PER_SECOND))
Seconds(x::Seconds) = x
Seconds(x::Minutes) = Seconds(value(x) * SECONDS_PER_MINUTE)
Seconds(x::QuarterHours) = Seconds(value(x) * SECONDS_PER_QUARTERHOUR)
Seconds(x::Hours) = Seconds(value(x) * SECONDS_PER_HOUR)
Seconds(x::Days) = Seconds(value(x) * SECONDS_PER_DAY)
Seconds(x::Weeks) = Seconds(value(x) * SECONDS_PER_WEEK)

Minutes(x::Nanoseconds)  = Minutes(div(value(x), NANOSECONDS_PER_MINUTE))
Minutes(x::Microseconds) = Minutes(div(value(x), MICROSECONDS_PER_MINUTE))
Minutes(x::Milliseconds) = Minutes(div(value(x), MILLISECONDS_PER_MINUTE))
Minutes(x::Seconds) = Minutes(div(value(x), SECONDS_PER_MINUTE))
Minutes(x::Minutes) = x
Minutes(x::QuarterHours) = Minutes(value(x) * MINUTES_PER_QUARTERHOUR)
Minutes(x::Hours) = Minutes(value(x) * MINUTES_PER_HOUR)
Minutes(x::Days) = Minutes(value(x) * MINUTES_PER_DAY)
Minutes(x::Weeks) = Minutes(value(x) * MINUTES_PER_WEEK)
QuarterHours(x::Nanoseconds)  = QuarterHours(div(value(x), NANOSECONDS_PER_QUARTERHOUR))
QuarterHours(x::Microseconds) = QuarterHours(div(value(x), MICROSECONDS_PER_QUARTERHOUR))
QuarterHours(x::Milliseconds) = QuarterHours(div(value(x), MILLISECONDS_PER_QUARTERHOUR))
QuarterHours(x::Seconds) = QuarterHours(div(value(x), SECONDS_PER_QUARTERHOUR))
QuarterHours(x::Minutes) = QuarterHours(div(value(x), MINUTES_PER_QUARTERHOUR))
QuarterHours(x::QuarterHours) = x
QuarterHours(x::Hours) = QuarterHours(value(x) * QUARTERHOURS_PER_HOUR)
QuarterHours(x::Days) = QuarterHours(value(x) * QUARTERHOURS_PER_DAY)
QuarterHours(x::Weeks) = QuarterHours(value(x) * QUARTERHOURS_PER_WEEK)
Hours(x::Nanoseconds)  = Hours(div(value(x), NANOSECONDS_PER_HOUR))
Hours(x::Microseconds) = Hours(div(value(x), MICROSECONDS_PER_HOUR))
Hours(x::Milliseconds) = Hours(div(value(x), MILLISECONDS_PER_HOUR))
Hours(x::Seconds) = Hours(div(value(x), SECONDS_PER_HOUR))
Hours(x::Minutes) = Hours(div(value(x), MINUTES_PER_HOUR))
Hours(x::QuarterHours) = Hours(div(value(x), QUARTERHOURS_PER_HOUR))
Hours(x::Hours) = x
Hours(x::Days) = Hours(value(x) * HOURS_PER_DAY)
Hours(x::Weeks) = Hours(value(x) * HOURS_PER_WEEK)

Days(x::Nanoseconds)  = Days(div(value(x), NANOSECONDS_PER_DAY))
Days(x::Microseconds) = Days(div(value(x), MICROSECONDS_PER_DAY))
Days(x::Milliseconds) = Days(div(value(x), MILLISECONDS_PER_DAY))
Days(x::Seconds) = Days(div(value(x), SECONDS_PER_DAY))
Days(x::Minutes) = Days(div(value(x), MINUTES_PER_DAY))
Days(x::QuarterHours) = Days(div(value(x), QUARTERHOURS_PER_DAY))
Days(x::Hours) = Days(div(value(x), HOURS_PER_DAY))
Days(x::Days) = x
Days(x::Weeks) = Days(value(x) * DAYS_PER_WEEK)

Weeks(x::Nanoseconds)  = Weeks(div(value(x), NANOSECONDS_PER_WEEK))
Weeks(x::Microseconds) = Weeks(div(value(x), MICROSECONDS_PER_WEEK))
Weeks(x::Milliseconds) = Weeks(div(value(x), MILLISECONDS_PER_WEEK))
Weeks(x::Seconds) = Weeks(div(value(x), SECONDS_PER_WEEK))
Weeks(x::Minutes) = Weeks(div(value(x), MINUTES_PER_WEEK))
Weeks(x::QuarterHours) = Weeks(div(value(x), QUARTERHOURS_PER_WEEK))
Weeks(x::Hours) = Weeks(div(value(x), HOURS_PER_WEEK))
Weeks(x::Days) = Weeks(div(value(x), DAYS_PER_WEEK))
Weeks(x::Weeks) = x

Months(x::Months) = x
Months(x::Quarters) = Months(value(x) * MONTHS_PER_QUARTER)
Months(x::Years) = Months(value(x) * MONTHS_PER_YEAR)
Months(x::Decades) = Months(value(x) * MONTHS_PER_DECADE)
Months(x::Centuries) = Months(value(x) * MONTHS_PER_CENTURY)
Quarters(x::Months) = Quarters(div(value(x), MONTHS_PER_QUARTER))
Quarters(x::Quarters) = x
Quarters(x::Years) = Quarters(value(x) * QUARTERS_PER_YEAR)
Quarters(x::Decades) = Quarters(value(x) * QUARTERS_PER_DECADE)
Quarters(x::Centuries) = Quarters(value(x) * QUARTERS_PER_CENTURY)
Years(x::Months) = Years(div(value(x), MONTHS_PER_YEAR))
Years(x::Quarters) = Years(div(value(x), QUARTERS_PER_YEAR))
Years(x::Years) = x
Years(x::Decades) = Years(value(x) * YEARS_PER_DECADE)
Years(x::Centuries) = Years(value(x) * YEARS_PER_CENTURY)
Decades(x::Months) = Decades(div(value(x), MONTHS_PER_DECADE))
Decades(x::Quarters) = Decades(div(value(x), QUARTERS_PER_DECADE))
Decades(x::Years) = Decades(div(value(x), YEARS_PER_DECADE))
Decades(x::Decades) = x
Decades(x::Centuries) = Decades(value(x) * DECADES_PER_CENTURY)
Centuries(x::Months) = Centuries(div(value(x), MONTHS_PER_CENTURY))
Centuries(x::Quarters) = Centuries(div(value(x), QUARTERS_PER_CENTURY))
Centuries(x::Years) = Centuries(div(value(x), YEARS_PER_CENTURY))
Centuries(x::Decades) = Centuries(div(value(x), DECADES_PER_CENTURY))
Centuries(x::Centuries) = x
