@inline nanoseconds(x::Day)  = Base.Dates.value(x) * NANOSECONDS_PER_DAY
@inline nanoseconds(x::Hour) = Base.Dates.value(x) * NANOSECONDS_PER_HOUR
@inline nanoseconds(x::Minute) = Base.Dates.value(x) * NANOSECONDS_PER_MINUTE
@inline nanoseconds(x::Second) = Base.Dates.value(x) * NANOSECONDS_PER_SECOND
@inline nanoseconds(x::Millisecond) = Base.Dates.value(x) * NANOSECONDS_PER_MILLISECOND
@inline nanoseconds(x::Microsecond) = Base.Dates.value(x) * NANOSECONDS_PER_MICROSECOND
@inline nanoseconds(x::Nanosecond)  = Base.Dates.value(x)
@inline months(x::Month) = Base.Dates.value(x)
@inline months(x::Year) = Base.Dates.value(x) * MONTHS_PER_YEAR

@inline nanoseconds(x::Weeks)  = value(x) * NANOSECONDS_PER_WEEK
@inline nanoseconds(x::Days)  = value(x) * NANOSECONDS_PER_DAY
@inline nanoseconds(x::Hours) = value(x) * NANOSECONDS_PER_HOUR
@inline nanoseconds(x::Minutes) = value(x) * NANOSECONDS_PER_MINUTE
@inline nanoseconds(x::Seconds) = value(x) * NANOSECONDS_PER_SECOND
@inline nanoseconds(x::Milliseconds) = value(x) * NANOSECONDS_PER_MILLISECOND
@inline nanoseconds(x::Microseconds) = value(x) * NANOSECONDS_PER_MICROSECOND
@inline nanoseconds(x::Nanoseconds)  = value(x)
@inline months(x::Months) = value(x)
@inline months(x::Quarters) = value(x) * QUARTERS_PER_YEAR
@inline months(x::Year) = value(x) * MONTHS_PER_YEAR

for P in (:Day, :Hour, :Minute, :Second, :Millisecond, :Microsecond, :Nanosecond)
    @eval Nanoseconds(x::$P) = Nanoseconds(nanoseconds(x))
end
for P in (:Weeks, :Days, :Hours, :Minutes, :Seconds, :Milliseconds, :Microseconds, :Nanoseconds)
    @eval Nanoseconds(x::$P) = Nanoseconds(nanoseconds(x))
end
for P in (:Year, :Month, :Years, :Months)
    @eval Months(x::$P) = Months(months(x))
end

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
