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
abstract type AttosecondBased <: SubsecondBased     end
abstract type NanosecondBased <: AttosecondBased    end
abstract type SecondBased     <: NanosecondBased    end
abstract type DayBased        <: SecondBased        end


#=>
     For the whole units of time Month and Year with familiar positive integer multiples
         [month, quarter] as {1, 3} Months and [year, decade] as {1, 10}
     Each of the YearBased units can be expressed exactly using the MonthBased units.
     None of the MonthBased units can be expressed exactly using the YearBased units.
     With abstract subtypes, this simplifies safe dispatch and helps with correctness.
<=#

abstract type MonthBased   <: AbstractTimePeriod end
abstract type YearBased    <: MonthBased end

abstract type SubsecondBased  <: AbstractTimePeriod end
abstract type AttosecondBased <: SubsecondBased     end
abstract type NanosecondBased <: AttosecondBased    end
abstract type SecondBased     <: NanosecondBased    end
abstract type DayBased        <: SecondBased        end

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
        struct $V <: $B
            value::Int64
        end
        @inline value(x::$V) = x.value

        $V(x::$V) where T = x
        
        function $V(x::S) where S<:String
            I = length(x) <= 12 ? Int64 : Int128
            val = parse(I, x)
            return $V(val)
        end
    end
end
