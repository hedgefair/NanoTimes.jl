function Clock(dt::Date)
    rata = date2rata(dt)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    return Clock(nanosec)
end

function Clock(dtm::DateTime)
    dat = Date(dtm)
    tim = Base.Dates.Time(dtm)
    return Clock(dat, tim)
end

function Clock(dat::Date, tim::Base.Dates.Time)
    rata = date2rata(dat)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    nanosec += tim.instant.value
    return Clock(I(nanosec))
end

Clock(str::String) = parse(Clock, str)

function Clock(year::I=I(year(now())), month::I=one(I), day::I=one(I),
               hour::I=zero(I), minute::I=zero(I), second::I=zero(I),
                 millisecond::I=zero(I), microsecond::I=zero(I), nanosecond::I=zero(I)) where I<:IntSpan
    dnanosec = nanosecond
    dnanosec += microsecond * NANOSECONDS_PER_MICROSECOND
    dnanosec += millisecond * NANOSECONDS_PER_MILLISECOND
    dnanosec += second * NANOSECONDS_PER_SECOND
    dnanosec += minute * NANOSECONDS_PER_MINUTE
    dnanosec += hour * NANOSECONDS_PER_HOUR
    return Clock(Date(year, month, day)) + Span(dnanosec)
end
     
function Clock(x::Base.Dates.Time)
    error("use Span(x::Base.Dates.Time), not Clock(x::Base.Dates.Time)")
end

function Date(x::Clock)
    nanos = fld(nanoseconds(x), NANOSECONDS_PER_DAY)
    dat = RATAFIRST + nanos
    return rata2date(dat)
end

function Base.Dates.Time(x::Clock)
    nanos = nanoseconds(x)
    return Base.Dates.Time(Nanosecond(nanos))
end

function DateTime(x::Clock)
    nanos = nanoseconds(x)
    dat, tim = fldmod(nanos, NANOSECONDS_PER_DAY)
    dat = rata2date(dat + RATAFIRST)
    tim = Base.Dates.Time(Nanosecond(tim))
    return dat+tim
end
