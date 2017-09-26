
abstract type MonthBased{T}   <: AbstractTimePeriod{T} end
abstract type YearBased{T}    <: MonthBased{T}         end

abstract type SubsecondBased{T}  <: AbstractTimePeriod{T} end
abstract type AttosecondBased{T} <: SubsecondBased{T}     end
abstract type NanosecondBased{T} <: AttosecondBased{T}    end
abstract type SecondBased{T}     <: NanosecondBased{T}    end
abstract type DayBased{T}        <: SecondBased{T}        end

#=
    struct <symbol> .. end
    singular form holds a singleton type

    struct <symbol>s .. end
    plural form holds a wrapper type
=#

sym2syms(z) = (z, Symbol(string(z,'s')))

for (P,S) in map(sym2syms, [:Year, :Decade, :Century])
  @eval begin
    struct $P{T} <: YearBased{T} end

    struct $S{T} <: YearBased{T}
        value::T

        function $S(::Type{T}, value::S) where {S<:String,T}
            val = parse(T,value)
            return new{T}( val )
        end
    end
    value(x::$S{T}) where T = x.value

    $S(x::$S{T}) where T = x
    $S{T1}(x::$S{T2}) where {T1,T2} = $S(T1(value(x)))
    $S(x::S) where S<:String = $S( (length(x) <= 12 ? Int64 : Int128), x )
  end
end

for (P,S) in map(sym2syms, [:Month, :Quarter])
  @eval begin
    struct $P{T} <: MonthBased{T} end

    struct $S{T} <: MonthBased{T}
        value::T

        function $S(::Type{T}, value::S) where {S<:String,T}
            val = parse(T,value)
            return new{T}( val )
        end
    end
    value(x::$S{T}) where T = x.value

    $S(x::$S{T}) where T = x
    $S{T1}(x::$S{T2}) where {T1,T2} = $S(T1(value(x)))
    $S(x::S) where S<:String = $S( (length(x) <= 12 ? Int64 : Int128), x )
  end
end

for (P,S) in map(sym2syms, [:Day, :Week])
  @eval begin
    struct $P{T} <: DayBased{T} end

    struct $S{T} <: DayBased{T}
        value::T

        function $S(::Type{T}, value::S) where {S<:String,T}
            val = parse(T,value)
            return new{T}( val )
        end
    end
    value(x::$S{T}) where T = x.value

    $S(x::$S{T}) where T = x
    $S{T1}(x::$S{T2}) where {T1,T2} = $S(T1(value(x)))
    $S(x::S) where S<:String = $S( (length(x) <= 12 ? Int64 : Int128), x )
  end
end

for (P,S) in map(sym2syms, [:Second, :Minute, :Hour])
  @eval begin
    struct $P{T} <: SecondBased{T} end

    struct $S{T} <: SecondBased{T}
        value::T

        function $S(::Type{T}, value::S) where {S<:String,T}
            val = parse(T,value)
            return new{T}( val )
        end
    end
    value(x::$S{T}) where T = x.value

    $S(x::$S{T}) where T = x
    $S{T1}(x::$S{T2}) where {T1,T2} = $S(T1(value(x)))
    $S(x::S) where S<:String = $S( (length(x) <= 12 ? Int64 : Int128), x )
  end
end

for (P,S) in map(sym2syms, [:Nanosecond, :Microsecond, :Millisecond])
  @eval begin
    struct $P{T} <: NanosecondBased{T} end

    struct $S{T} <: NanosecondBased{T}
        value::T

        function $S(::Type{T}, value::S) where {S<:String,T}
            val = parse(T,value)
            return new{T}( val )
        end
    end
    value(x::$S{T}) where T = x.value

    $S(x::$S{T}) where T = x
    $S{T1}(x::$S{T2}) where {T1,T2} = $S(T1(value(x)))
    $S(x::S) where S<:String = $S( (length(x) <= 12 ? Int64 : Int128), x )
  end
end

for (P,S) in map(sym2syms, [:Attosecond, :Femtosecond, :Picosecond])
  @eval begin
    struct $P{T} <: AttosecondBased{T} end

    struct $S{T} <: AttosecondBased{T}
        value::T

        function $S(::Type{T}, value::S) where {S<:String,T}
            val = parse(T,value)
            return new{T}( val )
        end
    end
    value(x::$S{T}) where T = x.value

    $S(x::$S{T}) where T = x
    $S{T1}(x::$S{T2}) where {T1,T2} = $S(T1(value(x)))
    $S(x::S) where S<:String = $S( (length(x) <= 12 ? Int64 : Int128), x )
  end
end

