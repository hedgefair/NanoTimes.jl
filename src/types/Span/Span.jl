struct Span{T} <: AbstractTimeSpan{T}
    value::T
end

@inline value(x::Span{T}) where T = x.value

function Span(value::T) where T<:Union{Int16, Int32, UInt16, UInt32, UInt64}
    try
        return Span(convert(Int64, value))    
    catch e
        throw(e)
    end
end

function Span(value::T) where T<:Integer
    try
        return Span(convert(Int128, value))    
    catch e
        throw(e)
    end
end

function Span(value::T) where T<:Base.Dates.AbstractTime
    try
         return convert(Span, value)
     catch e
         throw(e)
     end
end
