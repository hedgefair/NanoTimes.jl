#=
    LocalTime values are held this way:
       local_time is universal_time + UTM2LCL[1]
=#
struct LocalTime <: AbstractClock
    value::IntTime

	function LocalTime(raw_nanosecs::IntTime)
	   return new(raw_nanosecs)
	end
end

@inline value(x::LocalTime) = x.value

@inline Clock(x::LocalTime) = Clock(value(x))
@inline LocalTime(x::Clock) = LocalTime(value(x))

@inline LocalTime(x::LocalTime) = x

LocalTime() = LocalTime(UnivTime())

Base.Dates.DateTime(x::LocalTime) = Base.Dates.DateTime(Clock(x))
Base.Dates.Date(x::LocalTime) = Base.Dates.Date(Clock(x))
Base.Dates.Time(x::LocalTime) = Base.Dates.Time(Clock(x))

LocalTime(x::Base.Dates.DateTime) = LocalTime(Clock(x))
LocalTime(x::Base.Dates.Date) = LocalTime(Clock(x))

LocalTime(x::T) where T<:Base.Dates.AbstractTime = LocalTime(Clock(x))


# This is the recommended conversion direction.
@inline LocalTime(x::UnivTime) =
    LocalTime(value(x) + nanoseconds(UTM2LCL[1]))

#=
   This version first refreshes UTM2LCL:
     if there has been a transition from
     local standard time to daylight time,
     or from daylight time to standard time,
     the conversion constant will be updated
   before it is applied.
=#

function LocalTime(x::UnivTime, refresh::Bool)
    refresh && refresh_universal_to_local()
  return LocalTime(x)
end

# This is an UNSAFE conversion direction.
#
#    Whenever possible, convert from UnivTime to LocalTime.
#    The result of this call is likely to be inconsistent
#    with tier 1 clocks annually, for at least a half-hour.
#
@inline UnivTime(x::LocalTime) =
    UnivTime(value(x) - nanoseconds(UTM2LCL[1]))


Base.:(+)(x::LocalTime, y::T) where T<:NanosecondBased =
    LocalTime(Clock(x) + y)
Base.:(+)(x::LocalTime, y::T) where T<:MonthBased =
    LocalTime(Clock(x) + y)
Base.:(+)(x::T, y::LocalTime) where T<:NanosecondBased =
    LocalTime(Clock(y) + x)
Base.:(+)(x::T, y::LocalTime) where T<:MonthBased =
    LocalTime(Clock(y) + x)
Base.:(-)(x::LocalTime, y::T) where T<:NanosecondBased =
    LocalTime(Clock(x) - y)
Base.:(-)(x::LocalTime, y::T) where T<:MonthBased =
    LocalTime(Clock(x) - y)

for P in [:Year, :Month, :Years, :Quarters, :Months,
          :year, :month, :years, :quarters, :months,
          :Week, :Day, :Hour, :QuarterHour, :Minute,
		  :Second, :Millisecond, :Microsecond, :Nanosecond,
          :Weeks, :Days, :Hours, :QuarterHours, :Minutes,
		  :Seconds, :Milliseconds, :Microseconds, :Nanoseconds,
		  :week, :day, :hour, :quarterhour, :minute,
		  :second, :millisecond, :microsecond, :nanosecond,
          :weeks, :days, :hours, :quarterhours, :minutes,
		  :seconds, :milliseconds, :microseconds,
		  :nanoseconds ]
    @eval $P(x::LocalTime) = $P(Clock(x))
end
