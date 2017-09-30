struct Clock <: AbstractClock
    value::IntTime
end

@inline value(x::Clock) = x.value

function Clock(value::T) where T<:Union{Int16, Int32, UInt16, UInt32, UInt64}
    try
        return Clock(convert(IntTime, value))    
    catch e
        throw(e)
    end
end

function Clock(value::T) where T<:Integer
    try
        return Clock(convert(IntTime, value))    
    catch e
        throw(e)
    end
end

function Clock(value::T) where T<:Base.Dates.AbstractTime
    try
         return convert(Clock, value)
     catch e
         throw(e)
     end
end
