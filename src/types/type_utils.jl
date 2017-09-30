Base.sum(x::Base.Dates.CompoundPeriod) = sum(typeof(x.periods[end]).(x.periods))
