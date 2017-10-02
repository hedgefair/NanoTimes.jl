
struct Span <: AbstractTimeSpan
    value::IntTime
end

@inline value(x::Span) = x.value

@inline Span(x::Span) = x

@inline Base.eltype(::Type{Span}) = IntTime
@inline Base.eltype(x::T) where T<: AbstractTimeSpan = typeof(x.value)

@inline function Span(value::T) where T<:Integer
    return Span( IntTime(value) )
end

function Span(value::T) where T<:Base.Dates.AbstractTime
     return convert(Span, value)
end

Base.zero(::Type{T}) where T<:AbstractTimeSpan = T(zero(eltype(T)))

Base.isequal(x::T, y::T) where T<:AbstractTimeSpan = isequal(value(x), value(y))
Base.isless(x::T, y::T) where T<:AbstractTimeSpan = isless(value(x), value(y))
Base.:(==)(x::T, y::T) where T<:AbstractTimeSpan = (==)(value(x), value(y))
Base.:(<)(x::T, y::T) where T<:AbstractTimeSpan = (<)(value(x), value(y))
Base.:(<=)(x::T, y::T) where T<:AbstractTimeSpan = (<=)(value(x), value(y))
