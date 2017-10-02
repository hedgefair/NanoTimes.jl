struct TimeSpan <: AbstractTimeSpan
    signednanos::IntSpan
    signedmonths::IntSpan
end
@inline value(x::TimeSpan) = (x.signednanos, x.signedmonths)
@inline nanoseconds(x::TimeSpan) = x.signednanos
@inline months(x::TimeSpan) = x.signedmonths

TimeSpan(x::TimeSpan) = x

Base.zero(::Type{TimeSpan}) = TimeSpan(zero(IntSpan), zero(IntSpan))

TimeSpan(x::Span) = TimeSpan(value(x), zero(IntSpan))
TimeSpan(x::T) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x), zero(IntSpan))
TimeSpan(x::T) where T<:MonthBased =
    TimeSpan(zero(IntSpan), months(x))

function TimeSpan(x::Base.Dates.CompoundPeriod)
    result = zero(TimeSpan)
	for p in x.periods
	   result = result + p
	end
	return result
end

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
    TimeSpan(nanoseconds(x)+nanoseconds(y), months(x)+months(y))
Base.:(-)(x::TimeSpan, y::TimeSpan) =
    TimeSpan(nanoseconds(x)-nanoseconds(y), months(x)-months(y))

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
    TimeSpan(nanoseconds(x) * y, months(x) * y)
Base.:(*)(x::I, y::TimeSpan) where I<:Union{Int64, Int32} =
    TimeSpan(x * nanoseconds(y), x * months(y))


Base.:(+)(x::Span, y::TimeSpan) = TimeSpan(x) + y
Base.:(+)(x::TimeSpan, y::Span) = x + TimeSpan(y)
Base.:(-)(x::Span, y::TimeSpan) = TimeSpan(x) - y
Base.:(-)(x::TimeSpan, y::Span) = x - TimeSpan(y)

Base.:(+)(x::Clock, y::Span) = x + TimeSpan(y)
Base.:(+)(x::Span, y::Clock) = y + TimeSpan(x)
Base.:(-)(x::Clock, y::Span) = x - TimeSpan(y)
Base.:(-)(x::Span, y::Clock) =
    throw(ErrorException("`Span - Clock` is invalid -- use `Clock - Span`."))

Base.:(+)(x::UnivTime, y::Span) = x + TimeSpan(y)
Base.:(+)(x::Span, y::UnivTime) = y + TimeSpan(x)
Base.:(-)(x::UnivTime, y::Span) = x - TimeSpan(y)
Base.:(-)(x::Span, y::UnivTime) =
    throw(ErrorException("`Span - Clock` is invalid -- use `Clock - Span`."))

Base.:(+)(x::LocalTime, y::Span) = x + TimeSpan(y)
Base.:(+)(x::Span, y::LocalTime) = y + TimeSpan(x)
Base.:(-)(x::LocalTime, y::Span) = x - TimeSpan(y)
Base.:(-)(x::Span, y::LocalTime) =
    throw(ErrorException("`Span - Clock` is invalid -- use `Clock - Span`."))

Base.:(+)(x::Clock, y::TimeSpan) =
   (Date(x) + Years(y) + Months(y)) + (Time24(x) + Nanoseconds(y))
Base.:(+)(x::TimeSpan, y::Clock) = y + x
Base.:(-)(x::Clock, y::TimeSpan) =
   (Date(x) - Years(y) - Months(y)) + (Time24(x) - Nanoseconds(y))

Base.:(+)(x::UnivTime, y::TimeSpan) =
   (Date(x) + Years(y) + Months(y)) + (Time24(x) + Nanoseconds(y))
Base.:(+)(x::TimeSpan, y::UnivTime) = y + x
Base.:(-)(x::UnivTime, y::TimeSpan) =
   (Date(x) - Years(y) - Months(y)) + (Time24(x) - Nanoseconds(y))

Base.:(+)(x::LocalTime, y::TimeSpan) =
   (Date(x) + Years(y) + Months(y)) + (Time24(x) + Nanoseconds(y))
Base.:(+)(x::TimeSpan, y::LocalTime) = y + x
Base.:(-)(x::LocalTime, y::TimeSpan) =
   (Date(x) - Years(y) - Months(y)) + (Time24(x) - Nanoseconds(y))
