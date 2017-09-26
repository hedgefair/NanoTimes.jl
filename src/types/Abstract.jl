#=>
    It is important that provide a shared abstraction 
    used for all interoperable manner of typed times..
    This has been `AbstractTime` in Base.Dates.

    JuliaTime will release AbstractTimes.jl, a small
    module from which to export a more refined type
    and the few sub-abstractions deemed advantageous
    for dispatch management and leaf type design.
<=#    

import Base.Dates.AbstractTime

abstract type TemporalAbstraction <: Base.Dates.AbstractTime end

#=>
    Type Parameters

    T is the primitive type used for time keeping in the applicable frame
    Z is locative as an operational relative frame for temporal reference
<=#

abstract type AbstractMoment{T}      <: TemporalAbstraction end
abstract type AbstractDuration{T}    <: TemporalAbstraction end

abstract type AbstractClock{T}       <: AbstractMoment{T} end  # date with timeofday
abstract type AbstractDate{T,Z}      <: AbstractClock{T}  end  # date without timeofday
abstract type AbstractTimeOfDay{T,Z} <: AbstractClock{T}  end  # timeofday without date


#=>
    Kinds of Duration

    unattached ( not rooted to a specific initial moment )
               *  clock2 - clock1, date2 - date1
               *  three months and five days

    attached   ( temporal exent taken from a specific initial moment )
               *  the second Friday after the first Monday in September 2017
               *  every other Tuesday starting with 2017-10-03
               *  the end of the current Quarter

    undirected ( temporal extent that is unsigned )
               * a cover encompassing moments given as equi-grain [multi-]sequence[s]

    oriented   ( temporal extent signed, and {- abs} apply )
               * a span, an inclusion of moment-grain sequence[s]
<=#

#=
abstract type AbstractTimePeriod{T} <: AbstractDuration{T} end # attachable undirected
abstract type AbstractTimeSpan{T}   <: AbstractDuration{T} end # unattached oriented

abstract type TimePeriods{T,Z} <: AbstractTimePeriod{T} end # Z relative, mean solar seconds
abstract type TimeSpans{T,Z}   <: AbstractTimeSpan{T}   end # Z relative, 86400 SI seconds
=#

#= was

import Base.Dates.AbstractTime

abstract type AbstractTimePeriod{T} <: AbstractDuration{T} end # attachable undirected
abstract type AbstractTimeSpan{T}   <: AbstractDuration{T} end # unattached oriented

abstract type TimePeriods{T,Z} <: AbstractTimePeriod{T} end # Z relative, mean solar seconds
abstract type TimeSpans{T,Z}   <: AbstractTimeSpan{T}   end # Z relative, 86400 SI seconds

=#
