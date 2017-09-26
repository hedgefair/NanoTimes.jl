struct Clock{T} <: AbstractClock{T}
    value::T
end

@inline value(x::Clock{T}) where T<:IntTimes = x.value

Clock(value::T) where T<:IntTimes = Clock{T}(value)

function Clock(value::T) where T<:Base.Dates.AbstractTime
    try
         return convert(Clock, value)
     catch e
         throw(e)
     end
end

# use Clock{Int64} as the default Clock type

Clock(x::T) where T = Clock{Int64}(x)
Clock(x::T1, y::T2) where T2 where T1 = Clock{Int64}(x, y)
