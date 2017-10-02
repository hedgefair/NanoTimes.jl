#=
     For the whole units of time Month and Year with familiar positive integer multiples,
         [month, quarter, year] as {1, 3, 12} Months and [year, decade] as {1, 10} Years,
     Each of the YearBased units can be expressed exactly using at least one of the MonthBased units.
     None of the MonthBased units can be expressed exactly using any of the YearBased units.
     These abstract subtype relationships are used to simplify safe dispatch and provide correctness.
=#

abstract type MonthBased   <: AbstractTimePeriod end
abstract type YearBased    <: MonthBased         end

abstract type SubsecondBased  <: AbstractTimePeriod end
abstract type NanosecondBased <: SubsecondBased     end
abstract type SecondBased     <: NanosecondBased    end
abstract type DayBased        <: SecondBased        end

for (B,V) in [
    (:NanosecondBased, :Nanoseconds),
    (:NanosecondBased, :Microseconds),
    (:NanosecondBased, :Milliseconds),
    (:SecondBased, :Seconds),
    (:SecondBased, :Minutes),
    (:SecondBased, :QuarterHours),
    (:SecondBased, :Hours),
    (:SecondBased, :Days),
    (:SecondBased, :Weeks),
    (:MonthBased, :Months),
    (:MonthBased, :Quarters),
    (:YearBased, :Years),
    (:YearBased, :Decades),
    (:YearBased, :Centuries)
  ]
    @eval begin
        struct $V <: $B
            value::IntSpan
        end
        @inline value(x::$V) = x.value

        function $V(x::S) where S<:String
            val = parse(IntSpan, x)
            return $V(val)
        end

    end
end

for (P) in [ :Nanoseconds, :Microseconds, :Milliseconds,
             :Seconds,:Minutes,:QuarterHours, :Hours, :Days, :Weeks,
             :Months, :Quarters,:Years, :Decades, :Centuries ]
  @eval begin
     Base.zero(::Type{$P}) = $P(0); Base.zero(x::$P) = zero($P)
     Base.one(::Type{$P}) = $P(1);  Base.one(x::$P) = one($P)

     Base.isequal(x::T, y::T) where T<:$P = isequal(value(x), value(y))
     Base.isless(x::T, y::T) where T<:$P = isless(value(x), value(y))
     Base.:(==)(x::T, y::T) where T<:$P = (==)(value(x), value(y))
     Base.:(<)(x::T, y::T) where T<:$P = (<)(value(x), value(y))
     Base.:(<=)(x::T, y::T) where T<:$P = (<=)(value(x), value(y))
  end
end

Base.isequal(x::T, y::T) where T<:AbstractTimePeriod = isequal(value(x), value(y))
Base.isless(x::T, y::T) where T<:AbstractTimePeriod = isless(value(x), value(y))
Base.:(==)(x::T, y::T) where T<:AbstractTimePeriod = (==)(value(x), value(y))
Base.:(<)(x::T, y::T) where T<:AbstractTimePeriod = (<)(value(x), value(y))
Base.:(<=)(x::T, y::T) where T<:AbstractTimePeriod = (<=)(value(x), value(y))

