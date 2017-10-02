#=>
    It is important that provide a shared abstraction
    used for all interoperable manner of typed times..
    This has been `AbstractTime` in Base.Dates.
    JuliaTime will release AbstractTimes.jl, a small
    module from which to export a more refined type
    and the few sub-abstractions deemed advantageous
    Type Parameters
    T is the primitive type used for time keeping in the applicable frame
    R is gives a temporal frame of reference, e.g. local, ut, tai ..
<=#

import Base.Dates.AbstractTime

"""
     TemporalAbstraction
This is our root abstraction for matters of time.
"""
abstract type TemporalAbstraction <: Base.Dates.AbstractTime end

"""
    AbstractMoment
A moment is granular position along the continuum of time.
You can think of moments as fat points in time.  Moments that
cover a second are "thinner" than moments covering an hour.
"""
abstract type AbstractMoment   <: TemporalAbstraction end  # fat points in time

"""
    AbstractClock
A clock tracks date and time of day.
"""
abstract type AbstractClock      <: AbstractMoment end

"""
    AbstractDate
A date tracks calendric dates.
"""
abstract type AbstractDate       <: AbstractClock end

"""
    AbstractTimeOfDay
A timeofday tracks time within a date.
"""
abstract type AbstractTimeOfDay  <: AbstractClock end

"""
    AbstractDuration
A duration is an extent that collects successive moments of time.
You can think of durations as steps through time.
"""
abstract type AbstractDuration <: TemporalAbstraction end

"""
    AbstractTimePeriod
A period is a granular duration (e.g. Year, Day, Second).
"""
abstract type AbstractTimePeriod <: AbstractDuration end

"""
    AbstractTimeSpan
A time span is a signed succession of time periods.
"""
abstract type AbstractTimeSpan <: AbstractDuration end

"""
    AbstracSimpleSpan
A span of time represented by an integer multiple of
  a time unit that is supported as a time period.
g
"""
abstract type AbstractSimpleSpan <: AbstractTimwSpan end

"""
    AbstractMultiSpan
A span of time represented by more than one SimpleSpan.
The implict (or quiesent) sum of incommensurable time units;
this multivalued potentiality collapses uniquely when
attached to any situated moment.
Given a rooting date, time of day and time zone,
any legitimate (well formed, appropriately bounded)
MultiSpan may be added onto or subracted into the
rooted moment.  When being applied, the MultiSpan
melds with Moment. This adaption displaces about a
timeline: this is experienced as temporal resituation.
"""
abstract type AbstractMultiSpan <: AbstractSimpleSpan end
