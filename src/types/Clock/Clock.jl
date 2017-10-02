struct Clock <: AbstractClock
    value::IntTime
end

@inline value(x::Clock) = x.value

@inline function Clock(value::T) where T<:Integer
    return Clock( IntTime(value) )
end

function Clock(value::T) where T<:Base.Dates.AbstractTime
     return convert(Clock, value)
end

Base.isequal(x::T, y::T) where T<:AbstractClock = isequal(value(x), value(y))
Base.isless(x::T, y::T) where T<:AbstractClock = isless(value(x), value(y))
Base.:(==)(x::T, y::T) where T<:AbstractClock = (==)(value(x), value(y))
Base.:(<)(x::T, y::T) where T<:AbstractClock = (<)(value(x), value(y))
Base.:(<=)(x::T, y::T) where T<:AbstractClock = (<=)(value(x), value(y))

