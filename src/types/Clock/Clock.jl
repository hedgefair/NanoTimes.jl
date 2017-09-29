struct Clock{T} <: AbstractClock{T}
    value::T

    function Clock(value::T) where T<:IntTimes
        return new{T}(value)
    end
end

@inline value(x::Clock{T}) where T = x.value

function Clock(value::T) where T<:Union{Int16, Int32, UInt16, UInt32, UInt64}
    try
        return Clock(convert(Int64, value))    
    catch e
        throw(e)
    end
end

function Clock(value::T) where T<:Integer
    try
        return Clock(convert(Int128, value))    
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
