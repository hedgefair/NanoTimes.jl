struct Clock <: AbstractClock
    value::IntTime
end

@inline value(x::Clock) = x.value

function Clock(value::T) where T<:Integer
    val = IntTime(value)
	return Clock(val)    
end

function Clock(value::T) where T<:Base.Dates.AbstractTime
     return convert(Clock, value)
end
