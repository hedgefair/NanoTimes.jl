struct Clock{T} <: AbstractClock{T}
    value::T
end

@inline value(x::Clock{T}) where T = x.value

Base.convert(::Type{Clock{T}}, x::Int64) where T<:IntTimes = Clock(x)
Base.convert(::Type{Clock{T}}, x::Int128) where T<:IntTimes = Clock(x)

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
