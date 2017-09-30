struct TimeSpan <: AbstractTimeSpan
    nanos::IntSpan
	months::IntSpan
end
@inline nanoseconds(x::TimeSpan) = x.nanos
@inline months(x::TimeSpan) = x.months

TimeSpan(x::Span) = TimeSpan(value(x), zero(IntSpan))
TimeSpan(x::T) where T<:NanosecondBased =
    TimeSpan(nanoseconds(x), zero(IntSpan))
TimeSpan(x::T) where T<:MonthBased =
    TimeSpan(zero(IntSpan), months(x))

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
    TimeSpan(nanoseconds(x)+nanoseconds(y),
	         months(x)+months(y))
Base.:(-)(x::TimeSpan, y::TimeSpan) =
    TimeSpan(nanoseconds(x)-nanoseconds(y),
	         months(x)-months(y))

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
    TimeSpan(nanoseconds(x) * y,
	         months(x) * y)
Base.:(*)(x::I, y::TimeSpan) where I<:Union{Int64, Int32} =
    TimeSpan(x * nanoseconds(y),
	         x * months(y))
