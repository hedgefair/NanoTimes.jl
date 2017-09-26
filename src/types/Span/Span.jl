struct Span{T} <: AbstractTimeSpan{T}
    value::T
end

@inline value(x::Span{T}) where T<:IntTimes = x.value

Span(value::T) where T<:IntTimes = Span{T}(value)

function Span(value::T) where T <:AbstractTime
    try
         return convert(Span, value)
     catch e
         throw(e)
     end
end

# use Span{Int64} as the default Span type

Span(x::T) where T = Span{Int64}(x)
Span(x::T1, y::T2) where T2 where T1 = Span{Int64}(x, y)
