import Base: (+), (-)

(+)(x::Clock, y::Span) = Clock(nanoseconds(x) + nanoseconds(y))
(+)(x::Span, y::Clock) = Clock(nanoseconds(x) + nanoseconds(y))

(-)(x::Clock, y::Span) = Clock(nanoseconds(x) - nanoseconds(y))

(-)(x::Span, y::Clock) where I<:IntTimes =
    throw(ErrorException("Span-Clock is invalid;  write Clock-Span."))

(-)(x::Clock, y::DateTime) = x - Clock(y)
(-)(x::DateTime, y::Clock) = Clock(x) - y
(-)(x::Clock, y::Date) = x - Clock(y)
(-)(x::Date, y::Clock) = Clock(x) - y
(-)(x::Clock, y::Time24) = x - Span(y)

(-)(x::DateTime, y::Span) = Clock(x) - y
(-)(x::Date, y::Span) = Clock(x) - y
(-)(x::Span, y::Time24) = x - Span(y)

(+)(x::DateTime, y::Span{I}) = Clock(x) + y
(+)(x::Date, y::Span) = Clock(x) + y
(+)(x::Time24, y::Span) = Span(x) + y

(+)(x::Span, y::DateTime) = Clock(y) + x
(+)(x::Span, y::Date) = Clock(y) + x
(+)(x::Span, y::Time24) = x + Span(y)
