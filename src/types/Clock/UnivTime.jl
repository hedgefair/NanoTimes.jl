#=
    UnivTime values are held this way:
       local_time is universal_time + UTM2LCL[1]
=#
struct UnivTime <: AbstractClock
    value::IntTime
end

@inline value(x::UnivTime) = x.value

@inline Clock(x::UnivTime) = Clock(value(x))
@inline UnivTime(x::Clock) = UnivTime(value(x))

UnivTime() = UnivTime(now(Base.Dates.UTM))

@inline UnivTime(x::UnivTime) = x

Base.Dates.DateTime(x::UnivTime) = Base.Dates.DateTime(Clock(x))
Base.Dates.Date(x::UnivTime) = Base.Dates.Date(Clock(x))
Base.Dates.Time(x::UnivTime) = Base.Dates.Time(Clock(x))


UnivTime(x::Base.Dates.DateTime) = UnivTime(Clock(x))
UnivTime(x::Base.Dates.Date) = UnivTime(Clock(x))

UnivTime(x::T) where T<:Base.Dates.AbstractTime = UnivTime(Clock(x))

Base.:(+)(x::UnivTime, y::T) where T<:NanosecondBased =
    UnivTime(Clock(x) + y)
Base.:(+)(x::UnivTime, y::T) where T<:MonthBased =
    UnivTime(Clock(x) + y)
Base.:(+)(x::T, y::UnivTime) where T<:NanosecondBased =
    UnivTime(Clock(y) + x)
Base.:(+)(x::T, y::UnivTime) where T<:MonthBased =
    UnivTime(Clock(y) + x)
Base.:(-)(x::UnivTime, y::T) where T<:NanosecondBased =
    UnivTime(Clock(x) - y)
Base.:(-)(x::UnivTime, y::T) where T<:MonthBased =
    UnivTime(Clock(x) - y)

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
    @eval $P(x::UnivTime) = $P(Clock(x))
end
