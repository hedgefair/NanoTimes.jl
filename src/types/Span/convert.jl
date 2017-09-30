function Span(x::Base.Dates.Time)
    return Span(x.instant.value)
end

function Span(x::CompoundPeriod)
    nanosecs = sum(map(a->Nanosecond(a), x.periods))
    return Span(nanosecs.value)
end

Span(x::Day)  = Span(x.value * NANOSECONDS_PER_DAY)
Span(x::Hour) = Span(x.value * NANOSECONDS_PER_HOUR)
Span(x::Minute) = Span(x.value * NANOSECONDS_PER_MINUTE)
Span(x::Second) = Span(x.value * NANOSECONDS_PER_SECOND)
Span(x::Millisecond) = Span(x.value * NANOSECONDS_PER_MILLISECOND)
Span(x::Microsecond) = Span(x.value * NANOSECONDS_PER_MICROSECOND)
Span(x::Nanosecond)  = Span(x.value)

function Span(day::Int64=zero(I),
              hour::I=zero(I), minute::I=zero(I), second::I=zero(I),
              millisecond::I=zero(I), microsecond::I=zero(I), 
              nanosecond::I=zero(I)) where I<:IntTime
    dnanosec = nanosecond
    dnanosec += microsecond * NANOSECONDS_PER_MICROSECOND
    dnanosec += millisecond * NANOSECONDS_PER_MILLISECOND
    dnanosec += second * NANOSECONDS_PER_SECOND
    dnanosec += minute * NANOSECONDS_PER_MINUTE
    dnanosec += hour * NANOSECONDS_PER_HOUR
    dnanosec += day * NANOSECONDS_PER_DAY
    return Span(dnanosec)
end

Span(str::String) = parse(Span, str)

function Span(x::DateTime)
    error("use Clock(x::DateTime), not Span(x::DateTime)")
end
