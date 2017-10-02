using Nulls

@inline is_univtime(x::UnivTime)   = true
@inline is_univtime(x::LocalTime)  = false
@inline is_localtime(x::UnivTime)  = false
@inline is_localtime(x::LocalTime) = true

@inline is_univtime(x::Clock)  = null
@inline is_localtime(x::Clock) = null
