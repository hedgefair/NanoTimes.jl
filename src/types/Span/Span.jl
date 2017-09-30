struct Span <: AbstractTimeSpan
    value::IntTime
end

@inline value(x::Span) = x.value

struct Span <: AbstractTimeSpan
    value::IntTime
end

@inline value(x::Span) = x.value

function Span(value::T) where T<:Integer
    val = IntTime(value)
	return Span(val)    
end

function Span(value::T) where T<:Base.Dates.AbstractTime
     return convert(Span, value)
end
