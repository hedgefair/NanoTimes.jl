#=
     For the whole units of time Month and Year with familiar positive integer multiples,
         [month, quarter, year] as {1, 3, 12} Months and [year, decade] as {1, 10} Years,  

     Each of the YearBased units can be expressed exactly using at least one of the MonthBased units.
     None of the MonthBased units can be expressed exactly using any of the YearBased units.

     These abstract subtype relationships are used to simplify safe dispatch and provide correctness.
<=#

abstract type MonthBased{T}   <: AbstractTimePeriod{T} end
abstract type YearBased{T}    <: MonthBased{T}         end

abstract type SubsecondBased{T}  <: AbstractTimePeriod{T} end
abstract type AttosecondBased{T} <: SubsecondBased{T}     end
abstract type NanosecondBased{T} <: AttosecondBased{T}    end
abstract type SecondBased{T}     <: NanosecondBased{T}    end
abstract type DayBased{T}        <: SecondBased{T}        end


#=>
     For the whole units of time Month and Year with familiar positive integer multiples
         [month, quarter] as {1, 3} Months and [year, decade] as {1, 10}

     Each of the YearBased units can be expressed exactly using the MonthBased units.
     None of the MonthBased units can be expressed exactly using the YearBased units.

     With abstract subtypes, this simplifies safe dispatch and helps with correctness.
<=#

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

for (B,S,V) in [
    (:AttosecondBased, :Attosecond, :Attoseconds),
    (:AttosecondBased, :Femtosecond, :Femtoseconds),
    (:AttosecondBased, :Picosecond, :Picoseconds),
    (:NanosecondBased, :Nanosecond, :Nanoseconds),
    (:NanosecondBased, :Microsecond, :Microseconds),
    (:NanosecondBased, :Millisecond, :Milliseconds),
    (:SecondBased, :Second, :Seconds),
    (:SecondBased, :Minute, :Minutes),
    (:SecondBased, :Hour, :Hours),
    (:MonthBased, :Month, :Months),
    (:MonthBased, :Quarter, :Quarters),
    (:YearBased, :Year, :Years),
    (:YearBased, :Decade, :Decades),
    (:YearBased, :Century, :Centuries) 
  ]
    @eval begin
        struct $S{T} <: $B{T} end

        struct $V{T} <: $B{T}
            value::T
        end
        @inline value(x::$V{T}) where T = x.value

        $V(x::$V{T}) where T = x
        $V{T}(x::$V{T}) where T = x
        
        function $V{I}(x::$V{J}) where I where J
            val = trunc(I, value(x))
            return $V(val)
        end
        function $V(x::S) where S<:String
            I = length(x) <= 12 ? Int64 : Int128
            val = parse(I, x)
            return $V(val)
        end
    end
end

# disallow conversions with mismatched scales
for (A,B) in [
    (:AttosecondBased, :SecondBased)
    (:AttosecondBased, :MonthBased)
    (:AttosecondBased, :YearBased)
    (:NanosecondBased, :MonthBased)
    (:NanosecondBased, :YearBased)
    (:SecondBased, :MonthBased)
    (:SecondBased, :YearBased)
  ]
    @eval begin
        function Base.convert(::Type{T1}, x::T2) where T1<:A{T} where T2<:B{T} where T<:Int64
            throw(ErrorException("Unsupported conversion"))
        end
        function Base.convert(::Type{T2}, x::T1) where T1<:A{T} where T2<:B{T} where T<:Int64
            throw(ErrorException("Unsupported conversion"))
        end
    end
end

