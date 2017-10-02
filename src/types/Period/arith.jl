Base.:(+)(x::T, y::T) where T<:SecondBased =
    (T)(value(x) + value(y))
Base.:(-)(x::T, y::T) where T<:SecondBased =
    (T)(value(x) - value(y))
Base.:(+)(x::T, y::T) where T<:NanosecondBased =
    (T)(value(x) + value(y))
Base.:(-)(x::T, y::T) where T<:NanosecondBased =
    (T)(value(x) - value(y))
Base.:(+)(x::T, y::T) where T<:MonthBased =
    (T)(value(x) + value(y))
Base.:(-)(x::T, y::T) where T<:MonthBased =
    (T)(value(x) - value(y))

Base.:(+)(x::T1, y::T2) where T1<:SecondBased where T2<:SecondBased =
    (+)(promote(x, y)...)
Base.:(-)(x::T1, y::T2) where T1<:SecondBased where T2<:SecondBased =
    (-)(promote(x, y)...)
#=Base.:(+)(x::T1, y::T2) where T1<:NanosecondBased where T2<:NanosecondBased =
    (+)(promote(x, y)...)
Base.:(-)(x::T1, y::T2) where T1<:NanosecondBased where T2<:NanosecondBased =
    (-)(promote(x, y)...)
Base.:(+)(x::T1, y::T2) where T1<:MonthBased where T2<:MonthBased =
    (+)(promote(x, y)...)
Base.:(-)(x::T1, y::T2) where T1<:MonthBased where T2<:MonthBased =
    (-)(promote(x, y)...)
=#	