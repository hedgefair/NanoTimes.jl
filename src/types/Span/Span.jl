struct Span <: AbstractSpan
    value::IntTime
end

@inline value(x::Span) = x.value

function Span(value::T) where T<:Union{Int16, Int32, UInt16, UInt32, UInt64}
    try
        return Span(convert(IntTime, value))    
    catch e
        throw(e)
    end
end

function Span(value::T) where T<:Integer
    try
        return Span(convert(IntTime, value))    
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
