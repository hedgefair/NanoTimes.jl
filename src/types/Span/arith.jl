import Base: (+), (-), (*), signbit

@inline function signbit(x::Span)
    return signbit(nanoseconds(x))
end

function Base.sign(x::Span)
    return sign(nanoseconds(x))
end

function Base.abs(x::Span)
    nanos = abs(nanoseconds(x))
    return Span(nanos)
end

function Base.abs2(x::Span)
    nanos = abs2(nanoseconds(x))
    return Span(nanos)
end

function (-)(x::Span)
    nanos = -nanoseconds(x)
    return Span(nanos)
end

function (-)(x::Span, y::Span)
    nanos = nanoseconds(x) - nanoseconds(y)
    return Span(nanos)
end

function (*)(x::I, y::Span) where I<:Union{Int32, Int64}
    nanos = x * nanoseconds(y)
    return Span(nanos)
end
function (*)(x::Span, y::I) where I<:Union{Int32, Int64}
    nanos = y * nanoseconds(x)
    return Span(nanos)
end

(Base.div)(x::Span, y::Span) = div(nanoseconds(x), nanoseconds(y))
(Base.fld)(x::Span, y::Span) = fld(nanoseconds(x), nanoseconds(y))
(Base.cld)(x::Span, y::Span) = cld(nanoseconds(x), nanoseconds(y))
(Base.mod)(x::Span, y::Span) = mod(nanoseconds(x), nanoseconds(y))
(Base.rem)(x::Span, y::Span) = rem(nanoseconds(x), nanoseconds(y))
(Base.divrem)(x::Span, y::Span) = div(x,y), rem(x,y)
(Base.fldmod)(x::Span, y::Span) = fld(x,y), mod(x,y)



for P in [:Nanosecond, :Microsecond, :Millisecond, 
          :Second, :Minute, :Hour, :Day, :Week,
		  :Nanoseconds, :Microseconds, :Milliseconds, 
          :Seconds, :Minutes, :Hours]
    @eval begin
        (+)(x::Span, p::$P) = Span(nanoseconds(x) + nanoseconds(p))
        (+)(p::$P, x::Span) = Span(nanoseconds(x) + nanoseconds(p))
        (-)(x::Span, p::$P) = Span(nanoseconds(x) - nanoseconds(p))
        (-)(p::$P, x::Span) = Span(nanoseconds(x) - nanoseconds(p))
    end
end
