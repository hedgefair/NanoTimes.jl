import Base: (+), (-)

function (-)(x::Clock, y::Clock)
    nanosecs = nanoseconds(x) - nanoseconds(y)
    return Span(nanosecs)
end

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::Clock, p::$P) = Clock(nanoseconds(x) + nanoseconds(p))
        (+)(p::$P, x::Clock) = Clock(nanoseconds(x) + nanoseconds(p))
        (-)(x::Clock, p::$P) = Clock(nanoseconds(x) - nanoseconds(p))
    end
end
